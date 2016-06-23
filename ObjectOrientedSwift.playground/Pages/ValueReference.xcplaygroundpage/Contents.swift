/* Structs vs Classes

    struct - automatically get member wise initilaziers for stored properties
    class - init needs to be defined
 
    struct - No Inheritance
    class - Inheritance
 
    struct - Value Types
           - Simple Data or Values
           - Identity
    class - Reference Types

    Value and Reference Types doc
    https://developer.apple.com/swift/blog/?id=10
 
    Initializing a Subclass
        1. Provide values for properties of the subclass
        2. Once the subclass is initialized, provide values for properties of the base class
 
*/
struct User {
    var fullName: String
    var email: String
    var age: Int
}

var someUser = User(fullName: "James McMillan", email: "jmcmillan@gmail.com", age: 33)

var anotherUser = someUser

someUser.email = "james_mcmillan@icloud.com"

someUser.email

anotherUser.email


class Person {
    var fullName: String
    var email: String
    var age: Int
    
    init(name: String, email: String, age: Int) {
        self.fullName = name
        self.email = email
        self.age = age
    }
}

var somePerson = Person(name: "Tim Cook", email: "tim.cook@apple.com", age: 54)

var anotherPerson = somePerson

somePerson.email = "tcook@apple.com"

somePerson.email

anotherPerson.email
