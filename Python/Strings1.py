s = "Hey there! what should this string be?"
print("The length of the string is %d" % len(s))

print("The first occurence of the letter a is on position %d" % s.index("a"))
print("The number of a's = %d" % s.count("a"))

print("The first 5 letters are %s" % s[0:5])
print ("The next 5 letters are %s" % s[5:10])
print("The 13th letter is %s" %s[12])
print("The characters with an odd index are %s" % s[1::2])
print("The characters with an even index are %s" % s[0::2])
print("The last 5 characters are %s" % s[-5::1])

print(s.upper())
print(s.lower())

if s.startswith("Hey"):
        print("good")
if s.endswith("be?"):
        print("good")
        
print(s.split (" "))
        