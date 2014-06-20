import os
import glob

# Logscale range settings
logtdeclo = -2.0
logtdechi = 1.0
nlogsteps = 1000

# File handling settings
numuinfile = 'tnudecin.dat' # File read by public_bigbang for log(numu)
numuotpref = 'tdecot_'	  # File prefix for public_bigbang outputs

# Cleanup any existing output files in this directory
os.system('rm ' + 'numuotpref' + '*.dat.*')

# Initialize bbang_numu.dat
fbnm = open('bbang_tdec.dat','w')
fbnm.write('nmu      tdc      p      d      he3      he4      li6      li7      heavy\n')
fbnm.close()

lnmstep = (logtdechi-logtdeclo)/float(nlogsteps-1)
for i in range(0,nlogsteps):
	# Write the lognumu to the input file
	fnm = open(numuinfile,'w')
	fnm.write(str(logtdeclo+lnmstep*i))
	fnm.close()
	
	# Run public_bigbang
	os.system('./public_bigbang')

	# Label output files from this run
	otfiles = glob.glob(numuotpref + '*.dat')
	for j in otfiles:
		os.system('mv ' + j + ' ' + j + '.' + str(i))
