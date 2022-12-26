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

    new_sig1 = (('0' * diff) + num1['sig'])[:sig_width+1]
    #new_sig1 = (('0' * diff) + (('0' if num1_zero else '1') + num1['sig']))[:sig_width+1]
    #new_sig2 = ('0' if num2_zero else '1') + num2['sig']

    return num2['exp'], new_sig1, num2['sig']

def add(addend1, addend2):
    sum_arr = ['0' for i in range(sig_width)]
    carry = 0
    for i in range(sig_width, 0, -1):
        temp_sum = int(addend1[i-1]) + int(addend2[i-1]) + carry
        sum_arr[i-1] = str(temp_sum % 2)
        carry = 1 if temp_sum > 1 else 0

    return str(carry) + ''.join(sum_arr)

def normalize(exp, sig):
    shift_amt = 1 - sig.find('1')
   
    if shift_amt > 1:
        return {'exp': '0' * exp_width, 'sig': '0' * sig_width}
    
    fmt_str = '{{:0{}b}}'.format(exp_width)
    new_exp = fmt_str.format(int(exp, 2) + shift_amt)
    return {'exp': new_exp, 'sig': sig[sig.find('1'):sig.find('1') + sig_width]} 

def run_test(testcase):
    final_exp, add_sig1, add_sig2 = align(*sort(testcase['f1'], testcase['f2']))
    added_sig = add(add_sig1, add_sig2)
    result = normalize(final_exp, added_sig)

    if result['exp'] != testcase['e']['exp'] or result['sig'] != testcase['e']['sig']:
        print('{} - FAIL - result: {}'.format(testcase['id'], result))

if __name__ == '__main__':

    tests = [
        {'id': 'zero', 'f1': {'exp': '00', 'sig': '0000'}, 'f2': {'exp': '00', 'sig': '0000'}, 'e': {'exp': '00', 'sig': '0000'}},      # 0 + 0 = 0
        {'id': '1+1=2', 'f1': {'exp': '01', 'sig': '1000'}, 'f2': {'exp': '01', 'sig': '1000'}, 'e': {'exp': '10', 'sig': '1000'}},     # 1 + 1 = 2
        {'id': '1+0=1', 'f1': {'exp': '01', 'sig': '1000'}, 'f2': {'exp': '00', 'sig': '0000'}, 'e': {'exp': '01', 'sig': '1000'}},     # 1 + 0 = 1
        {'id': '2+1=3', 'f1': {'exp': '10', 'sig': '1000'}, 'f2': {'exp': '01', 'sig': '1000'}, 'e': {'exp': '10', 'sig': '1100'}},     # 2 + 1 = 3
        {'id': '2+2=4', 'f1': {'exp': '10', 'sig': '1000'}, 'f2': {'exp': '10', 'sig': '1000'}, 'e': {'exp': '11', 'sig': '1000'}},     # 2 + 2 = 4
        {'id': '3+0=3', 'f1': {'exp': '10', 'sig': '1100'}, 'f2': {'exp': '00', 'sig': '0000'}, 'e': {'exp': '10', 'sig': '1100'}},     # 3 + 0 = 3
        {'id': '3+2=5', 'f1': {'exp': '10', 'sig': '1100'}, 'f2': {'exp': '10', 'sig': '1000'}, 'e': {'exp': '11', 'sig': '1010'}},     # 3 + 2 = 5
        {'id': '4.5+.5=5', 'f1': {'exp': '11', 'sig': '1001'}, 'f2': {'exp': '00', 'sig': '1000'}, 'e': {'exp': '11', 'sig': '1010'}}   # 4.5 + 0.5 = 5
    ]

    for test in tests:
        run_test(test)
