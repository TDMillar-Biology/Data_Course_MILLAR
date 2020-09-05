def scrambled(strng):
   listed = list(enumerate(strng))
   listed2 = []
   print(listed)
   
   for index, letter in listed:
       if index % 2 == 0:
           listed2.append(letter.upper())
       else:
           listed2.append(letter.lower())        
   
   
   scrambledstring = ""
   for letter in listed2:
    scrambledstring = scrambledstring + letter
   return(scrambledstring)
print(scrambled('auspiciousstarrix'))

