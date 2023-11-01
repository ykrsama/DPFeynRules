#  ========================
#  Check environment
#  ------------------------
if ! command -v mg5_aMC &> /dev/null ; then
    echo "[ERROR] mg5_aMC: command not found"
    exit
fi
# ========================
# Settings 
# ------------------------
job_dir="jobs_enuc_eapnuc_1"
gen_macro="dp_generate.macro"
launch_macro="dp_launch.macro"
scan_list="dp_scan.txt"
scan_kwd="set Map"

read -p "Jobs dir to create? (default ${job_dir}): " read_job_dir
if [[ $read_job_dir != "" ]]; then
    job_dir=$read_job_dir
fi
if [[ -d $job_dir ]]; then
    echo "[ERROR] ${job_dir} already exists."
    exit
fi

if command -v condor_submit &> /dev/null ; then
    condor_now="y"
    read -p "Submit condor now? (default ${condor_now}): " read_condor_now
    if [[ $read_condor_now != "" ]]; then
        condor_now=$read_condor_now
    fi
fi

if [[ $condor_now != "y" ]]; then
    bash_now="y"
    read -p "Run bash now? (default ${bash_now}): " read_bash_now
    if [[ $read_bash_now != "" ]]; then
        bash_now=$read_bash_now
    fi
fi

# ==========================
# Main
# -------------------------
mkdir -p $job_dir
cd $job_dir
cp ../$gen_macro .
cp ../$launch_macro .
cp ../$scan_list .
cp ../print_crossx.sh .
chmod +x print_crossx.sh
sed -i -e "s:import model :import model ../:" $gen_macro

mg5_aMC ${gen_macro}
origin_output=$(ls -d */ | sed 's/\///')
if [[ ! -d $origin_output ]]; then
    echo "[Error] no output from mg5_aMC"
    exit
fi

n=1
while read -r line; do
    target_output="${origin_output}_${n}"
    cp -r ${origin_output} ${target_output}
    sed -e "s:${scan_kwd}:${scan_kwd} scan\:\[${line}\] \#:" < $launch_macro > ${target_output}/${launch_macro}
    cp ../template.condor ${target_output}/submit.condor
    if [[ $condor_now == "y" ]]; then
        cd ${target_output}
        condor_submit submit.condor
        cd ..
    elif [[ $bash_now == "y" ]]; then
        cd ${target_output}
        ./bin/madevent ${launch_macro} > dp.out 2> dp.err &
        cd ..
    fi
    let n++
done < ${scan_list}
rm -r ${origin_output}
wait
