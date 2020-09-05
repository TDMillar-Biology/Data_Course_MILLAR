Gamestate = ["1", "2","3","4","5","6","7","8","9"]

def display_board(Gamestate):
    ## function to print the gameboard, reflecting list Gamestate
    print("        " * 1000)
    print(Gamestate[6], "|", Gamestate[7],"|", Gamestate[8])
    print(Gamestate[3], "|",Gamestate[4],"|", Gamestate[5])
    print(Gamestate[0],"|",Gamestate[1], "|",Gamestate[2])
    
def gamepiece():
    ## funcition to allow player1 to select which gamepiece to use
    p1 = "THIS IS THE PROBLEM"
    p2 = "THIS IS THE PROBLEM"
    print('We will start by allowing player1 to select which gamepiece they will use')
    acceptablevalues = ['X','O']
    while p1 not in acceptablevalues:
        p1 = input("Which gamepiece would you like p1? (X or O): ")
        if p1 not in acceptablevalues:
            print("Sorry, That's not an acceptable response")
    if p1 == "X":
        print("Great, Player 1 is X, so Player 2 is O")
        p2 = "O"
    else:
        print("Great, Player 1 is O, so Player 2 is X")
        p2 = "X"
        
    Listed = [p1,p2]
    return Listed
    
def taketurn(Gamestate, choices):
    turncount = 1
    acceptablevalues = list(range(1,10))
    
    
    while turncount < 10:
        
        turnchoice = "Nope"
        if turncount % 2 == 1:
            while turnchoice not in acceptablevalues:
                turnchoice = int(input("Player 1, Where will you place your gamepiece?"))
                if turnchoice not in acceptablevalues:
                    print("Sorry, that's not an acceptable value")
            Gamestate[turnchoice -1] = choices[0]
            turncount += 1
            display_board(Gamestate)
        else:
            while turnchoice not in acceptablevalues:
                turnchoice = int(input("Player 2, Where will you place your gamepiece?"))
                if turnchoice not in acceptablevalues:
                    print("Sorry, that's not an acceptable value")
            Gamestate[turnchoice -1] = choices[1]
            turncount += 1
            display_board(Gamestate)
        won = wincondition(Gamestate)
        if won == True:
            break
        
def wincondition(Gamestate):
    if Gamestate[0] == Gamestate[1] and Gamestate[2] == Gamestate[1] and Gamestate[2] != " ":
        print(f"{Gamestate[2]} is the winner")
        return True
    elif Gamestate[3] == Gamestate[4] and Gamestate[5] == Gamestate[4] and Gamestate[5] != " ":
        print(f"{Gamestate[5]} is the winner")
        return True
    elif Gamestate[6] == Gamestate[7] and Gamestate[8] == Gamestate[7] and Gamestate[8] != " ":
        print(f"{Gamestate[8]} is the winner")
        return True
    elif Gamestate[0] == Gamestate[3] and Gamestate[6] == Gamestate[3] and Gamestate[6] != " ":
        print(f"{Gamestate[6]} is the winner")
        return True
    elif Gamestate[1] == Gamestate[4] and Gamestate[7] == Gamestate[4] and Gamestate[7] != " ":
        print(f"{Gamestate[7]} is the winner")
        return True
    elif Gamestate[2] == Gamestate[5] and Gamestate[8] == Gamestate[5] and Gamestate[8] != " ":
        print(f"{Gamestate[8]} is the winner")
        return True
    elif Gamestate[0] == Gamestate[4] and Gamestate[8] == Gamestate[4] and Gamestate[8] != " ":
        print(f"{Gamestate[8]} is the winner")
        return True
    elif Gamestate[2] == Gamestate[4] and Gamestate[6] == Gamestate[4] and Gamestate[6] != " ":
        print(f"{Gamestate[6]} is the winner")
        return True
    else:
        print("working")


display_board(Gamestate)
choices = gamepiece()

play = "Y"
while play == "Y":
    
    taketurn(Gamestate,choices) 
    play = input("Would you like to play again? (Y or N): ")
    if play == "Y":
        Gamestate = ["1", "2","3","4","5","6","7","8","9"]
        display_board(Gamestate)