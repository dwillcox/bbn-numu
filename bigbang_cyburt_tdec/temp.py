import math

magmom = 10.0

third = 1.0e0/3.0e0

planckiemass = 1.0e22
gfermico = 1.0e-11

sigmasofine=((1.0e0/137.0e0)*(1.0e0/137.0e0)*3.14159e0/(6.0e0*0.511e0*0.511e0))*(magmom**2.0e0)
firsties = (0.5e0/(planckiemass*gfermico*gfermico))
termie1 =  (1.0e0/27.0e0)*((sigmasofine**3.0e0)/(gfermico**2.0e0))
termie2 = (0.25e0/(planckiemass**2.0e0))
secondies = (1.0e0/(gfermico*gfermico))*math.sqrt(termie1+termie2)

tnudec = (((firsties+secondies)**third)+((firsties-secondies)**third))

print tnudec
