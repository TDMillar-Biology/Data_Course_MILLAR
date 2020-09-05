def paper_doll(text):
    listed = list(text)
    listed2 = ""
    for char in listed:
        listed2 = listed2 + char + char + char
    
    return(listed2)
 
    pass



print(paper_doll('Testing'))
