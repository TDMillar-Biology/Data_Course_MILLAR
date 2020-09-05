count = 1
sum = 0
while True:
    funct = (-1)**count * ((5*4*3*2*1*5)/(4*3*2*1))**0.5
    sum = sum + funct
    count = count + 1
    print (count)
    if count == 462:
        break
    
print (sum * -1)