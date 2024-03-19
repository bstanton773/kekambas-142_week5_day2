# If we list all the natural numbers below 10 that are multiples of 3 or 5, we 
# get 3, 5, 6 and 9. The sum of these multiples is 23.

# Finish the solution so that it returns the sum of all the multiples of 3 or 5 
# below the number passed in.

# Additionally, if the number is negative, return 0.

# Note: If the number is a multiple of both 3 and 5, only count it once.


def solution(num): # O(n)
    total = 0 # O(1)
    for i in range(1, num): # O(n)
        if i % 3 == 0 or i % 5 == 0: # O(1) + O(1)
            total += i # O(1)
    return total # O(1)


def solution(num): # O(n)
    num -= 1 # O(1)
    sum_lst = [] # O(1)
    while num > 0: # O(n)
        if num % 3 == 0: # O(1)
            sum_lst.append(num) # O(1)
        elif num % 5 == 0: # O(1)
            sum_lst.append(num) # O(1)
        num -= 1 #O(1)
    return sum(sum_lst) # O(n)


def solution(n): # O(1)
    if n < 1:
        return 0
    m3 = max(n-1,0) // 3
    # print(m3)
    m5 = max(n-1,0) // 5
    # print(m5)
    m15 = max(n-1,0) // 15
    # print(m15)
    total3 = (3 * (m3) * (m3 + 1)) // 2
    total5 = (5 * (m5) * (m5 + 1)) // 2
    total15 = (15 * (m15) * (m15 + 1)) // 2
    return total3 + total5 - total15