out_file=dp_ufo_scan.txt
rm -f $out_file
touch $out_file
for outdir in $(ls)
do
    if [[ ! -d $outdir ]]; then continue ; fi
    scan_file=$(ls ${outdir}/Events/scan_*.txt)
    while read -r line; do
        if [[ ${line:0:1} == "#" ]]; then continue; fi
        mass=$(echo $line|cut -d' ' -f2)
        crossx=$(echo $line|cut -d' ' -f3)
        echo $mass $crossx >> $out_file
    done < $scan_file
    
    #for results in $(ls $outdir/HTML/run_*/results.html)
    #do
    #    echo $results
    #done
done
