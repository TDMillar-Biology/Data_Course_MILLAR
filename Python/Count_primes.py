def count_primes(maxnum):
    numberlist = list(range(2,maxnum + 1))
    notprime = []
    prime = []
    guinneapig = []
    for num in numberlist:
        guinneapig = []
        for divisor in numberlist:
            if divisor == num:
                pass
            else:
                guinneapig.append(num % divisor)
        if 0 in guinneapig:
            notprime.append(num)
        else:
            prime.append(num)
                
    setofprimes = set(prime)
    setofnotprimes = set(notprime)
    print(f"Your prime numers are {setofprimes}")
    print(f"Your non-prime number are {setofnotprimes}")
                

    return(len(setofprimes))
print(count_primes(100))

