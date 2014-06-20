import os
import glob

# Logscale range settings
lognumulo = -15.0
lognumuhi = -6.0
nlogsteps = 100

# File handling settings
numuinfile = 'numuin.dat' # File read by public_bigbang for log(numu)
numuotpref = 'nmot_'	  # File prefix for public_bigbang outputs

# Cleanup any existing output files in this directory
os.system('rm ' + 'numuotpref' + '*.dat.*')

# Initialize bbang_numu.dat
fbnm = open('bbang_numu.dat','w')
fbnm.write('nmu      tdc      p      d      he3      he4      li6      li7      heavy\n')
fbnm.close()

lnmstep = (lognumuhi-lognumulo)/float(nlogsteps-1)
for i in range(0,nlogsteps):
	# Write the lognumu to the input file
	fnm = open(numuinfile,'w')
	fnm.write(str(lognumulo+lnmstep*i))
	fnm.close()
	
	# Run public_bigbang
	os.system('./public_bigbang')

	# Label output files from this run
	otfiles = glob.glob(numuotpref + '*.dat')
	for j in otfiles:
		os.system('mv ' + j + ' ' + j + '.' + str(i))
