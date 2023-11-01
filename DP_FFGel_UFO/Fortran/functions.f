double complex function mymdl_FormFactor(mymdl_t)
    implicit NONE
    double complex mymdl_t
    double complex Gel
    include 'input.inc' ! include all model parameter
    Gel = (mdl_anuc**2 * ZABS(mymdl_t) / (1 + mdl_anuc**2 * ZABS(mymdl_t)) / (1 + ZABS(mymdl_t) / mdl_dnuc) )**2
    mymdl_FormFactor = ZSQRT(Gel)
    return 
end
