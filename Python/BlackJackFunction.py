def blackjack(*args):
    if sum(args) < 21:
        export = sum(args)
        return export
    elif sum(args) > 21:
        if 11 in args:
            export = sum(args) - 10
            return export
        else:
            return 'BUST'
        
    pass

print(blackjack(9,9,11))
