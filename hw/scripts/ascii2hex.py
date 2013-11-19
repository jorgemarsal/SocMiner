import sys
sys.stdout.write('0x')
for letter in sys.argv[1]:
	sys.stdout.write('%s'%(hex(ord(letter))).replace('0x',''))
sys.stdout.write('\n')
