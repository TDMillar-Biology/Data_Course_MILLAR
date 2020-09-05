def spy_game(nums):
    proof0s = []
    proof7s = []
    doubleagent = []
    spy = 'False'
    for num in nums:
        if num == 0 or num == 7:
            doubleagent.append(num)
            
   
    enumerated = list(enumerate(doubleagent))   
  

    for index, num in enumerated:
        if num == 0:
            proof0s.append(index)
        if num == 7:
            proof7s.append(index)
            
            
    
    
    for num in proof0s:
        if num + 1 in proof0s and num + 2 in proof7s:
            spy = 'True'
         
            break
        else:
            continue
        
    return spy

print(spy_game([1,7,2,0,4,5,0]))