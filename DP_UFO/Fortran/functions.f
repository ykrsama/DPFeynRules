double complex function FormFactor(S1)
   double complex S1, Gel
   include 'input.inc' ! include all model parameter
   Gel = ((anuc**2 * abs(S1)) / (1 + anuc**2 * abs(S1)) / (1 + abs(S1)/dnuc) )**2
   FormFactor = SQRT(Gel) 
   return 
end
