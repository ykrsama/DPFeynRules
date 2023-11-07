double complex function mymdl_FormFactor(mymdl_t)
    implicit NONE
    double complex mymdl_t
    double complex mymdl_t_abs
    double complex Gel
    double complex Gin
    include 'input.inc' ! include all model parameter
    mymdl_t_abs = ZABS(mymdl_t)
    Gel = (mdl_anuc**2 * mymdl_t_abs / (1 + mdl_anuc**2 * mymdl_t_abs) / (1 + mymdl_t_abs / mdl_dnuc) )**2
    Gin = (mdl_apnuc**2 * mymdl_t_abs * (1 + mymdl_t_abs * (mdl_mupnuc**2 - 1) / (4 * mdl_mpnuc**2) ) / (1 + mdl_apnuc**2 * mymdl_t_abs) / (1 + mymdl_t_abs / 0.71)**4 )**2 / mdl_znuc
    mymdl_FormFactor = ZSQRT(Gel + Gin)
    return 
end
