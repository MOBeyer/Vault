/*:
# Access control
Access control lets you restrict which code can use properties and methods. This is important because you might want to stop people reading a property directly, for example.

We could create a `Person` struct that has an `id` property to store their social security number:
*/
//#-editable-code Enter your code here
struct Person {
    var id: String
    
    init(id: String) {
        self.id = id
    }
}
    
let ed = Person(id: "12345")
//#-end-editable-code
/*:
Once that person has been created, we can make their `id` be private so you can’t read it from outside the struct – trying to write `ed.id` simply won’t work.

Just use the `private` keyword, like this:
*/
//#-editable-code Enter your code here
struct Person {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
}
//#-end-editable-code
/*:
Now only methods inside `Person` can read the `id` property. For example:
*/
//#-editable-code Enter your code here
struct Person {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "My social security number is \(id)"
    }
}
//#-end-editable-code
/*:
Another common option is `public`, which lets all other code use the property or method.*/
