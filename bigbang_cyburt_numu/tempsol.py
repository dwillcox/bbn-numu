import math

otname = 'tdec_real.dat'

logmulo = -20.0
logmuhi = 20.0
nmus = 100
logstep = (logmuhi-logmulo)/nmus

#mu = 1e-12

alpha = 1.0/137.0
me = 0.511
gf = 1.1664e-11
mpl= 1.221e22

otfile = open(otname,'w')

otfile.write('mu(muB)	Tdec(MeV)\n')

for j in range(0,nmus):

	print '------------------------------------------'

	thismu = 10.0**(logmulo+logstep*j)

	k = (2.0/((2.0*math.pi)**6.0))*(3.0/5.0)*(math.pi*(thismu*alpha)**2.0)/(me**2)
	p = k/(gf**2.0)
	q = 1.0/(mpl*(gf**2.0))

	c = 0.5*q*(3/abs(p))**(3.0/2.0)

	y=0.0
	#print 'mu='+str(thismu)
	formalsol = True
	if (c >= 1.0 and formalsol):
		#print 'c>=1'
		y = math.cosh((1.0/3.0)*math.acosh(c))
		#print 'y='+str(y)
	elif (c <= -1.0 and formalsol):
		print 'c<=-1'
		y = -math.cosh((1.0/3.0)*math.acosh(abs(c)))
		print 'y='+str(y)
	elif (abs(c) < 1.0 and formalsol):
		print '|c| < 1'
		y = math.cos((1.0/3.0)*math.acos(c))

	x=2.0*math.sqrt(abs(p)/3.0)*y
#	if (formalsol):
#		x = 2.0*math.sqrt(abs(p)/3.0)*y
#	else:
#		x = ((1.0/(mpl*gf**2.0)) - (k/gf**2.0)*(1.0/(mpl*gf**2))**(1.0/3.0))**(1.0/3.0)
#		R = q/2.0
#		Q = p/3.0
#		x = (R + math.sqrt(Q**3.0 + R**2.0))**(1.0/3.0) + (R - math.sqrt(Q**3.0 + R**2.0))**(1.0/3.0)

#	def itercubic(t):
#	        x = ((1.0/(mpl*gf**2.0)) - (k/gf**2.0)*t)**(1.0/3.0)
#        	return x
#
#	endloop = False
#	tp = (1.0/(mpl*gf**2.0))**(1.0/3.0)
#	while(not endloop):
#		tpp = itercubic(tp)
#		if (abs(tpp-tp)/tp < 1e-12):
#			endloop = True
#		tpp = tp

#	x = tp

	print 'root x='+str(x)
	otfile.write(str(thismu) + '	' + str(x) + '\n')

otfile.close()

#def itercubic(t):
#	x = ((1.0/(mpl*gf**2.0)) - (k/gf**2.0)*t)**(1.0/3.0)
#	return x
