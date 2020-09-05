def summer_69(arr):
    onoff = True
    listed = []
    summedup = 0
    count = 0 
    for num in arr:
        if num == 6:
            onoff = False
            pass
        if arr[count - 1] == 9:
            onoff = True
            pass
        
        if onoff == True:
            listed.append(num)
    
            pass
        count = count + 1
    summedup = sum(listed)
    return summedup

print(summer_69([4, 5, 6, 7, 8, 9]))