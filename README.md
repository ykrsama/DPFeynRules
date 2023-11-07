# The Dark Photon Kinetic Mixing Model

Requirement: MadGraph5 >= v3.5.1

Reference:

1. http://arxiv.org/abs/0906.0580
2. https://arxiv.org/abs/1209.6083

## Usage

An interactive script will create and submit the condor job:

```bash
./gen_jobs.sh
```

## Customize UFO:

1. **Prepare environment**

   1. Mathematica (https://tiebamma.github.io/InstallTutorial/)

   2. FeynRules (https://feynrules.irmp.ucl.ac.be)

2. **Edit model (based on the current model)**
   **The document for FeynRules: https://arxiv.org/pdf/1310.1921.pdf** 

   File structure:

   ```bash
   DPmodel.fr  # Load all the files
   DPLagrangian.fr  # Define Lagrangians
   DPParticleClasses.fr  # Define particle fields
   DPParameters.fr  # Internal and external parameters. The external parameter will who up in the parameter card in MadGraph.
   ```

   1. To add the nuclear form factor later, an N-N-e vertex was defined in the ```LNUC```  in ```DPLagrangian.fr```

   2. Replace the ```LAp``` with your own BSM Lagrangian. and add it to the total Lagrangian ```LDP```.

      An example of interaction between vector boson and fermion:

      1. ```Znuc ee A[mu] (NUCbar.Ga[mu].ProjP.NUC + NUCbar.Ga[mu].ProjM.NUC)```

         The ```.``` is the Mathematica dot function.  ```Znuc``` is the electric charge, ```ee``` is the coupling constant, ```A``` , ```NUCbar``` and ```NUC``` are vector fields. ```Ga[mu]``` is the Dirac matrix $\gamma^{\mu}$ , ```ProjP``` and ```ProjM``` are the chirality projection operators $\frac{1+\gamma^5}{2}$ and $\frac{1-\gamma^5}{2}$ .

   3. Add decay width for the BSM particle, and other needed parameters in ```DPParameters.fr```

   4. Define the BSM particle in ```DPParticleClasses.fr```

3. **Check the Lagrangian's hermiticity, mass spectrum, and kinetic terms**

   Example: ```DP_check.nb```

4. **Export to UFO**

Mathematica Notebook example:
```
Quit[]
Clear["Global`*"];
```

```
$FeynRulesPath =
  SetDirectory["/Users/xuliang/opt/feynrules-current"];
<< FeynRules`
SetDirectory[$FeynRulesPath <> "/Models/DP_KM"];
LoadModel["DPmodel.fr"]
WriteUFO[LDP];
```

2. **Add form factors:**

see https://cp3.irmp.ucl.ac.be/projects/madgraph/wiki/FormFactors#Method2:FortranWay

Examples: 

```
DP_FF_UFO
├── Fortran
│   └── functions.f
├── lorentz.py  # find FFV1FF
└──  vertices.py  # find particles = [ P.nuc__tilde__, P.nuc, P.a ],
```

