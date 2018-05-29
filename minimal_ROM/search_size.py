import re
import sys
pattern2 = re.compile('0x[0-9abcdef]+')
def kellenek(line):
    if line.find(" .text ")>=0:
        return True
    if line.find(" .rodata ")>=0:
        return True
    return False
def printsor(sor):
    for elem in sor:
        for line in elem[1]:
            sys.stdout.write(line)
def elemetsorba(elem):
    valt=1
    while (valt>0):
        valt=0
        elozo=0
        for i, n in enumerate(elem[1]):
            if (i>1) and (elozo<int(pattern2.findall(elem[1][i])[0], 16)):
                temp=elem[1][i-1]
                elem[1][i-1]=elem[1][i]
                elem[1][i]=temp
                valt+=1
            elozo=int(pattern2.findall(elem[1][i])[0], 16)
    return elem
def sorrend(tomb):
    valt=1
    while (valt>0):
        valt=0
        elozo=0
        for i, n in enumerate(tomb):
            if (i>0) and (elozo<int(pattern2.findall(tomb[i])[0], 16)):
                temp=tomb[i-1]
                tomb[i-1]=tomb[i]
                tomb[i]=temp
                valt+=1
            elozo=int(pattern2.findall(tomb[i])[0], 16)
    return tomb
def sorba(sor):
    valt=1
    while (valt>0):
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
    return sor
f = open("../build/jerry-main/output.map", "r")
sorban=False
kellhossz=False
sor=[]
sor2=[]
akt=[]
for line in f:
    if line.find(".")>=0 or not line.find(" 0x"):
        sorban=False
    if kellhossz and line.find(" 0x")>=0 and len(akt)>0:
        str=akt[len(akt)-1]
        cim=int(str[str.find(" 0x")+1:str.find(" 0x")+19], 16)
        utanacim=int(line[line.find(" 0x")+1:line.find(" 0x")+19], 16)
        akt[len(akt)-1]=str.replace('0x{0:0{1}x}'.format(cim,16), '0x{0:0{1}x}'.format(utanacim-cim,16))
        kellhossz=False
        if not sorban:
            size = pattern2.findall(akt[0])
            size=size[1]
            sor.append([size, akt])
            sor2.extend(akt[1:])
            akt=[]
    if akt!=[] and not sorban and not kellhossz:
        size = pattern2.findall(akt[0])
        size=size[1]
        sor.append([size, akt])
        akt=[]
    if sorban:
        akt.append(line)
        kellhossz=True
    if kellenek(line):
        akt=[line]
        sorban=True
if (len(sys.argv)==1):
    sor=sorba(sor)
    for i, n in enumerate(sor):
        sor[i]=elemetsorba(sor[i])
    printsor(sor)
if (len(sys.argv)==2):
    sor2=sorrend(sor2)
    for v in sor2:
        sys.stdout.write(v)
