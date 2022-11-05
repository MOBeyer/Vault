/*:
# Skipping items
As you’ve seen, the `break` keyword exits a loop. But if you just want to skip the current item and continue on to the next one, you should use `continue` instead.

To try this out, we can write a loop from 1 through 10, then use Swift’s remainder operator to skip any numbers that are odd:
*/
//#-editable-code Enter your code here
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    
    print(i)
}
//#-end-editable-code
/*:
Remember, the remainder operator figures out how many times 2 fits into each number in our loop, then returns whatever is left over. So, if 1 is left over, it means the number is odd, so we can use `continue` to skip it.*/
