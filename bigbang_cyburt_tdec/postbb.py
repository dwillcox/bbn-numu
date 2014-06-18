import operator
import linecache

finname = 'bbang_numu.dat'

fin = open(finname,'r')
fot = open('bbang_numu_post.dat','w')

# Transfer header
fot.write(fin.readline())

i = 0
s=''
for l in fin:
	i = i+1
	s = s+' '+l.rstrip('\n')
	if (i==9):
		fot.write(s+'\n')
		s=''
		i=0

fin.close()
fot.close()
