board_state = [' ',' ',' ',' ', ' ',' ',' ',' ',' ']
player1 = ""
player2 = ""
turnplayer = "player1"
turncounter = 1

def print_board():

    print(board_state[6] +"|"+ board_state[7]+"|"+board_state[8])
    print(board_state[3] +"|"+ board_state[4]+"|"+board_state[5])
    print(board_state[0] +"|"+ board_state[1]+"|"+board_state[2])
    
   
decided = False
while decided != True:
    decision = input("Player 1, X or O?")
    if decision == "X":
        player1 = "X"
        player2 = "O"
        decided = True
   
    elif decision == "O":
        player1 = "O"
        player2 = "X"
        decided = True
    else:
        print("I didnt understand your answer")
        
def check_for_win():
    if board_state[0] == board_state[1] and board_state[2] == board_state[1] and board_state[2] != " ":
        print(f"{board_state[2]} is the winner")
    elif board_state[3] == board_state[4] and board_state[5] == board_state[4] and board_state[5] != " ":
        print(f"{board_state[5]} is the winner")
    elif board_state[6] == board_state[7] and board_state[8] == board_state[7] and board_state[8] != " ":
        print(f"{board_state[8]} is the winner")
    elif board_state[0] == board_state[3] and board_state[6] == board_state[3] and board_state[6] != " ":
        print(f"{board_state[6]} is the winner")
    elif board_state[1] == board_state[4] and board_state[7] == board_state[4] and board_state[7] != " ":
        print(f"{board_state[7]} is the winner")
    elif board_state[2] == board_state[5] and board_state[8] == board_state[5] and board_state[8] != " ":
        print(f"{board_state[8]} is the winner")
    elif board_state[0] == board_state[4] and board_state[8] == board_state[4] and board_state[8] != " ":
        print(f"{board_state[8]} is the winner")
    elif board_state[2] == board_state[4] and board_state[6] == board_state[4] and board_state[6] != " ":
        print(f"{board_state[6]} is the winner")
    else:
        print("working")
        
    
print_board()

print(player1)

    
    
while turncounter < 10:
    if turncounter % 2 == 1:
        turnchoice = int(input(f"Player 1, where will you place your {player1}?"))
        board_state[turnchoice - 1] = player1
        turncounter = turncounter + 1
        print_board()
        check_for_win()
    else:
        turnchoice = int(input(f"Player 2, where will you place your {player2}?"))
        board_state[turnchoice - 1] = player2
        turncounter = turncounter + 1
        print_board()
        check_for_win()