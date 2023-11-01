double precision function mymdl_FormFactor(t)
    implicit NONE
    include 'input.inc' ! include all model parameter
    double precision t
    double precision Gel
    double precision OUTVAL
    Gel = (mdl_anuc**2 * t / (1 + mdl_anuc**2 * t) / (1 + t / mdl_dnuc) )**2
    mymdl_FormFactor = dsqrt(Gel) 
    !mymdl_FormFactor = 1.0 ! for no FF case
    OUTVAL = mymdl_FormFactor
    PRINT *, 't:', t
    PRINT *, 'Form Factor:', OUTVAL
    
    return 
end
