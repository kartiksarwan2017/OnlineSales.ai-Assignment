# PROBLEM STATEMENT: 
#    Task-3 Debugging
#      
#      Given below is a Bash / Python script that performs following computation on an integer input (n):
#      
#      If n is less than 10: Calculate its Square
#      Example: 4 => 16
#      
#      If n is between 10 and 20: Calculate the factorial of (n-10)
#      Example: 15 => 120
#     
#      If n is greater than 20: Calculate the sum of all integers between 1 and (n-20)
#      Example: 25 => 15


# Original Code with bugs
#     def compute(n):
#         if n < 10:
#             out = n ** 2
#         elif n < 20:
#             out = 1
#             for i in range(1, n-10):
#                 out *= i
#         else:
#             lim = n - 20
#             out = lim * lim
#             out = out - lim
#             out = out / 2 
#         print(out)
    
"""
In the given Python Script, there are a couple of bugs: 
 
In the elif condition, the code checks if n is less than 20 instead of checking if it is greater than or equal to 10 and less than 20. This will cause the condition to evaluate to True even for values of n that are equal to 20, leading to incorrect factorial calculations. 
 
In the else block, the calculation of out is incorrect. The intention seems to be calculating the sum of all integers between 1 and lim. However, the current code squares lim and then subtracts lim from it, which will always result in 0. The subsequent division by 2 will also produce incorrect results.

"""    



"""

In the corrected code: 
 
The elif condition is modified to check if n is greater than or equal to 10 and less than 20. 
 
The calculation of out in the else block is changed to use the sum() function to calculate the sum of integers from 1 to lim (inclusive).

"""

# Corrected Code
def compute(n): 
    if n < 10: 
        out = n ** 2 
    elif 10 <= n < 20: 
        out = 1 
        for i in range(1, n - 9): 
            out *= i 
    else: 
        lim = n - 20 
        out = sum(range(1, lim + 1)) 
    print(out) 
 
# Example usage 
n = int(input("Enter an integer: "))
compute(n)


