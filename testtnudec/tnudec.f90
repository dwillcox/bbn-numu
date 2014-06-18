program tnudec
double precision :: logmulo,logmuhi,step,mu,tdec
integer :: nstep,j

logmulo = -20
logmuhi = -6

nstep = 10000

step = (logmuhi-logmulo)/nstep

open(unit=1,file='tnudec_mu.dat',status='unknown')

write(1,01) 'mu','tdec'
01 format(1x,t4,a,t16,a)

do j=1,nstep
        mu = 10.0**(logmulo+step*j)
        call gettnudec(mu,tdec)
        write(1,02) mu,tdec
02 format(1x,es14.7)
enddo

close(unit=1)
end

subroutine gettnudec(magmom,thistnu)
        double precision firsties,secondies
        double precision gfermico,planckiemass,termie1,termie2
        double precision sigmasofine,basiesp,basiesm,third
        double precision magmom,thistnu

        third = 1.0d0/3.0d0

        planckiemass = 1.0d22
        gfermico = 1.0d-11

        sigmasofine=((1.0d0/137.0d0)*(1.0d0/137.0d0)*3.14159d0/(6.0d0*0.511d0*0.511d0))*(magmom**2.0d0)
        firsties = (0.5d0/(planckiemass*gfermico*gfermico))
        termie1 =(1.0d0/27.0d0)*((sigmasofine**3.0d0)/(gfermico**2.0d0))
        termie2 = (0.25d0/(planckiemass**2.0d0))
        secondies = (1.0d0/(gfermico*gfermico))*sqrt(termie1+termie2)
        basiesp = firsties+secondies
        basiesm = firsties-secondies
        ! Following is the correct way to compute fractional powers in fortran
        thistnu =(sign((abs(basiesp)**third),basiesp)+sign((abs(basiesm)**third),basiesm))
        ! This will give NaN for some values because the ** returns complex
        !thistnu = basiesp**third + basiesm**third

        return
      end

