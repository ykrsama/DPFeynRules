from object_library import all_form_factors, FormFactor

from function_library import complexconjugate, re, im, csc, sec, acsc, asec, cot

Gel = '((anuc**2 * _t_) / (1 + anuc**2 * _t_) / (1 + _t_/dnuc) )**2'

Gin = '(apnuc**2 * _t_ * (1 + _t_ * (mupnuc**2 - 1) / (4 * mpnuc**2)) / (1 + apnuc**2 * _t_) / (1 + _t_ / 0.71)**4 )**2 / Znuc'

FF = FormFactor(name = 'FF',
                type = 'real',
                value= ('sqrt(' + Gel + ')').replace('_t_','(P(-1,1)-P(-1,2))**2'))


