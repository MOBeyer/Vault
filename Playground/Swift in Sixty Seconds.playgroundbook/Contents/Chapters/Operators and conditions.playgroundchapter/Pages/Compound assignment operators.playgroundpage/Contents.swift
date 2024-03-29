/*:
# Compound assignment operators
Swift has shorthand operators that combine one operator with an assignment, so you can change a variable in place. These look like the existing operators you know – `+`, `-`, `*`, and `/`, but they have an `=` on the end because they assign the result back to whatever variable you were using.

For example, if someone scored 95 in an exam but needs to be penalized 5 points, you could write this:
*/
//#-editable-code Enter your code here
var score = 95
score -= 5
//#-end-editable-code
/*:
Similarly, you can add one string to another using `+=`:
*/
//#-editable-code Enter your code here
var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"
//#-end-editable-code
