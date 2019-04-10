'''
@ author: Andrei Militaru
@ date: 5th of April 2019
'''

def dec2bin(x,
            width = 16, 
            base = 2,
            twos_complement = False):
    '''
    Function that takes an integer input x and
    returns the string corresponding to its binary 
    encoding using "width" bits. Width defaults to 16.
    '''
    
    if not twos_complement:
    
        bin = [0 for i in range(width)]
        out = ''
        overflow = False
        if x > (base**width - 1):
            print('WARNING: overflow')
            overflow = True
        
        if overflow:
            x = x - (x // (base**width - 1)) * (base**width-1)
        
        for i in range(width):
            bin[i] = x // (base**(width - i - 1))
            x = x - (x // (base**(width - i - 1))) * (base**(width - i - 1))
            out += str(bin[i])      
            
    else:
        overflow = False
        
        if x > (base**(width-1) - 1) or x < -(base**(width-1)):
            print('WARNING: overflow')
            overflow = True
        
        if overflow:
            if x > (base**(width-1) - 1):
                x = x - (x // (base**(width-1) - 1)) * (base**(width-1)-1)
                
            elif x < -(base**(width-1)):
                x = x + (x // (base**(width-1))) * (base**(width-1))        
        out = dec2bin(x,
                      width = width,
                      base = base,
                      twos_complement = False) if x >= 0 else dec2bin(2**width + x,
                                                                      width = width,
                                                                      base = base,
                                                                      twos_complement = False)
        
    return out
    
    
    
def bin2dec(x,
            base = 2,
            twos_complement = False):
            
    width = len(x)
    out = 0
    
    for i in range(width-1):
        out += base**i * int(x[width - 1 - i])
        
    out += base**(width-1) * int(x[0]) if not twos_complement else (-base**(width-1) * int(x[0]))
    
    return out
            