import re
import sys
def printsor(sor):
    for elem in sor:
        for line in elem[1]:
            sys.stdout.write(line)
def sorba(sor):
    valt=0
    elozo=0
    for i, n in enumerate(sor):
        if i>0 and elozo<int(sor[i][0], 16):
            #print('0x{0:0{1}x}'.format(elozo,16))
            temp=sor[i-1]
            sor[i-1]=sor[i]
            sor[i]=temp
            valt+=1
        elozo=int(sor[i][0], 16)
    if valt>0:
        return sorba(sor)
    return sor
f = open("../build/jerry-main/output.map", "r")
sorban=False
sor=[]
akt=[]
pattern2 = re.compile('0x[0-9abcdef]+')
for line in f:
    if line.find(".")>=0 or not line.find(" 0x"):
        sorban=False
    if sorban:
        akt.append(line)
    if line.find(" .text ")>=0:
        if akt!=[]:
            size = pattern2.findall(akt[0])
            size=size[1]
            sor.append([size, akt])
        akt=[line]
        sorban=True
printsor(sorba(sor))
#for v in sorba(sor)[0][1]:
#    sys.stdout.write(v)
