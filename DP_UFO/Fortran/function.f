double complex function FormFactor(t)
double complex t
double precision, parameter :: Z, d = ( 74, 0.164)
double precision, parameter :: m_p, mu_p = (0.938 , 2.79)
double precision, parameter :: a = 111 * 74**(-1/3) / 0.511d-3
double precision, parameter :: ap = 773 * 74**(-2/3) / 0.511d-3
double precision, parameter :: G2_el, G2_in
include ’input.inc’ ! include all model parameter
G2_el = (a**2 * t / (1 + a**2 * t))**2 * (1 / (1 + t/d))**2 * Z**2
G2_in = ((ap**2 * t) / (1.0d0 + ap**2*t))**2 * ((1.0d0 + t * (mu_p**2 - 1.0d0) / (4.0d0 * m_p**2 )) * (1.0d0 + t / 0.71d0)**(-4))**2 * Z
FormFactor = G2_el + G2_in
return
end
