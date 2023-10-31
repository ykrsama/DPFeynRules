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

example form_factors.py:

```
from object_library import all_form_factors, FormFactor

from function_library import complexconjugate, re, im, csc, sec, acsc, asec, cot

Gel = '((anuc**2 * _t_) / (1 + anuc**2 * _t_))**2 * (1 / (1 + _t_/dnuc))**2 * Znuc**2'

Gin = '((apnuc**2 * _t_) / (1 + apnuc**2 * _t_))**2 * (1 + _t_ * (mupnuc**2 - 1) / (4 * mpnuc**2))  / (1 + _t_ / 0.71**2)**4 * Znuc'

FF = FormFactor(name = 'FF',
                type = 'real',
                value= ('sqrt(' + Gel + '+' + Gin + ')').replace('_t_','(P(-1,1)-P(-1,2))**2'))
```
