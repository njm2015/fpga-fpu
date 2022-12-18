#
# Number format: 2-tuple of string of 0's and 1's
# e.x. ['0101', '1100']
#

exp_width = 2
sig_width = 4

#
# Given 2 numbers, sort them and return them in 
# [smaller, bigger] form
#
def sort(num1, num2):
    for i in range(exp_width + sig_width):
        if (num1['exp'] + num1['sig'])[i] == '1' and (num2['exp'] + num2['sig'])[i] == '0':
            return [num2, num1]
        elif (num1['exp'] + num1['sig'])[i] == (num2['exp'] + num2['sig'])[i]:
            continue
        else:
            return [num1, num2]
    return [num1, num2]

def align(num1, num2):
    diff = int(num2['exp'], 2) - int(num1['exp'], 2)
    
    num1_zero = int(num1['exp'], 2) == 0 and int(num1['sig'], 2) == 0
    num2_zero = int(num2['exp'], 2) == 0 and int(num2['sig'], 2) == 0

    new_sig1 = (('0' * diff) + (('0' if num1_zero else '1') + num1['sig']))[:sig_width+1]
    new_sig2 = ('0' if num2_zero else '1') + num2['sig']

    return num2['exp'], new_sig1, new_sig2

def add(addend1, addend2):
    sum_arr = ['0' for i in range(sig_width + 1)]
    carry = 0
    for i in range(sig_width + 1, 0, -1):
        temp_sum = int(addend1[i-1]) + int(addend2[i-1]) + carry
        sum_arr[i-1] = str(temp_sum % 2)
        carry = 1 if temp_sum > 1 else 0

    return str(carry) + ''.join(sum_arr)

def normalize(exp, sig):
    pass

if __name__ == '__main__':
    f1 = {'exp': '00', 'sig': '0000'}
    f2 = {'exp': '00', 'sig': '0000'} 
    
    final_exp, add_sig1, add_sig2 = align(*sort(f1, f2))
    print('add_sig1: {}, addsig2: {}'.format(add_sig1, add_sig2))
    added_sig = add(add_sig1, add_sig2)
    print(added_sig)
    #print(normalize(final_exp, added_sig))
