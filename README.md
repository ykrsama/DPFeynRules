# The Dark Photon Kinetic Mixing Model

Requirement: MadGraph 3.x

Reference:

1. http://arxiv.org/abs/0906.0580
2. https://arxiv.org/abs/1209.6083

## Usage

This script will create and submit condor job:

```
./gen_jobs.sh
```

## Recreate UFO:

1. **Download feynrule, and create a Mathematica notebook**

Notebook example:
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

see https://cp3.irmp.ucl.ac.be/projects/madgraph/wiki/FormFactors
