import re
import sys

filename = sys.argv[1]
examples = ['input [4:0] data;',
'output [4:0] data;',
'input data;',
'output data;',
'input [`DATA:0] data;',
'input [DATA:0] data;',
'input logic [4:0] data;',
'input logic [`DATA-1:0] data;',
'input logic [DATA-1:0] data;',
]
regex = r'\b(input|output)\b\s*\b(?:logic|wire|reg)*\b\s*(?:\[(\S+):(\S+)\])*\s*(\w+)'

#for test in examples:
#    print test,'-> ',re.findall(regex, test)

#prefix = 'S_REGS_'
#ifname = 'axi4_if'
prefix = sys.argv[2]
ifname = sys.argv[3]
text = open(filename).read()
matches = re.findall(regex, text)
for direction, upper,lower,name in matches:
        value = 0
        if upper == '': upper = '0'
        if lower == '': lower = '0'
        try:
                value = int(upper)-int(lower)+1
        except ValueError:
                pass
        
        #print '%s wire [%s:%s] %s%s,'%(direction, upper, lower, prefix,name.upper())
        print 'wire [%s:%s] %s%s;'%(upper, lower, prefix,name.upper())


#for direction, upper,lower,name in matches:
#        if direction == 'output': print 'assign %s.%s = %s%s;' %(ifname,name, prefix,name.upper())
#        elif direction == 'input': print 'assign %s%s = %s.%s;' %(prefix,name.upper(), ifname,name)

for direction, upper,lower,name in matches:
        print '.%s(%s),'%(name, name.upper())

#for direction, upper,lower,name in matches:
#        print '.%s(%s.%s),'%(name, ifname, name.replace('m_memory_','').replace('s_regs_',''))
#for direction, upper,lower,name in matches:
#        print '.%s(%s.%s),'%(name.upper(), ifname, name.lower().replace('m_memory_','').replace('s_regs_',''))
#for direction, upper,lower,name in matches:
#        print '.%s(%s%s),'%(name.lower(), prefix, name.lower().replace('m_memory_','').replace('s_regs_',''))

#for direction, upper,lower,name in matches:
#        print 'logic [%s:%s] %s%s;'%(upper, lower, prefix,name.upper())

