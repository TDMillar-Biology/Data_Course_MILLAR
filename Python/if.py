genome_seq = 'Trevorsmadeupprotein'

    
genome_seq_list = list(enumerate(genome_seq))
print(genome_seq_list)

question1 = input('Number or Type?')

if question1 == 'number':
    resnum = int(input('What residue number are you looking for?'))
    for index, amino_acid in genome_seq_list:
        if index == resnum:
            print(f'I found {amino_acid} at index {index}')
              
                
elif question1 == 'type':
    restype = (input ('What residues are you looking for?'))
    for index, amino_acid in genome_seq_list:
        if amino_acid == restype:
            print(f'I found {restype} at potition {index}')



    