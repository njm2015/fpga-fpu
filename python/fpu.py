#
# Number format: 2-tuple of string of 0's and 1's
# e.x. ['0101', '1100']
#


#
# Given 2 numbers, sort them and return them in 
# [smaller, bigger] form
#
def sort(num1, num2):
    for i in range(len(num1)):
        if num1[i] == '1' and num2[i] == '0':
            return [num2, num1]
        elif num1[i] == num2[i]:
            continue
        else:
            return [num1, num2]
    return [num1, num2]

def align(num1, num2):
    pass

def add(num1, num2):
    pass

def normalize(num1, num2):
    pass

if __name__ == '__main__':
    print(sort('0011', '0011'))    
