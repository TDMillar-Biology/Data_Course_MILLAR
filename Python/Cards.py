from random import randint
random_number = randint(1,100)
guesses = []

warmmin = random_number - 10
warmmax = random_number + 11

warmrange = list(range(warmmin, warmmax))


fguess = int(input('What is your first guess?'))
guesses.append(fguess)


while guesses[-1] != random_number:
    if guesses[-1] > 100 or guesses[-1] < 1:
        print("Out of bounds")
        newguess = int(input('What is your next guess?'))
        guesses.append(newguess)
        
    if guesses[-1] in warmrange:
        print("You're warm")
        newguess = int(input('What is your next guess?'))    
        
        
        if guesses[-1] == random_number:
            print("That's right")
            guesses.append(newguess) 
            print(f"You made {len(guesses)} guesses")
            print(guesses)
             
        elif abs(newguess - random_number) > abs(guesses[-1] - random_number):
            print('Thats colder')
            guesses.append(newguess) 
            
            
        elif abs(newguess - random_number) < abs(guesses[-1] - random_number):
            print('Thats warmer')
            guesses.append(newguess) 
            
            
        elif abs(newguess - random_number) == abs(guesses[-1] - random_number):
            print('Thats neither warmer or colder')
            guesses.append(newguess) 
            
        
        
    else:
        newguess = int(input('What is your next guess?'))
        guesses.append(newguess)

print("That's right")

print(f"You made {len(guesses)} guesses")
print(guesses)