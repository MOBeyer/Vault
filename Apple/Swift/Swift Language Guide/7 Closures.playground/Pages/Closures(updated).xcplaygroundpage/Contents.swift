/*
 Global functions are closures that have a name and don’t capture any values.
 
 Nested functions are closures that have a name and can capture values from their enclosing function.
 
 Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.
 
 Inferring parameter and return value types from context
 
 Implicit returns from single-expression closures
 
 Shorthand argument names
 
 Trailing closure syntax
 
 */

//The sorted method

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

//Closure Expression Syntax

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

//Inferring Type from Context

//omit (->)
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )

//Implicit Return from Single-Expression Closure

//omit return
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

//Shorthand Argument Names

    //replace arguments, return, omit in 
reversedNames = names.sorted(by: { $0 > $1 } )

//Operator Methods
reversedNames = names.sorted(by: >)
