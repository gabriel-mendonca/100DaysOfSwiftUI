// Tratamento de dados perdidos

var age: Int? = nil

age = 38

// Desembalando opcionais

var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("missing name.")
}

// Desembrulhando com guarda

func greet(_ name: String?) {
    guard let unwrapped1 = name else {
        print("You didn't provide a name!")
        return
    }
    
    print("hello \(unwrapped1)")
}

// Forçar desembrulhar

let str = "5"
let num = Int(str)!

// Opcionais implicitamente desembrulhados

let age1: Int! = nil

// Nil coalescendo

func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "anonymous"

// Encadeamento opcional

let names = ["john", "Paul", "George", "Ringo"]

let beatles = names.first?.uppercased()

// Tentativa opcional

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    if let result = try? checkPassword("password") {
        print("Result was \(result)")
    } else {
        print("D'oh.")
    }
} catch {
    print("You can't use that password.")
}

// Inicializadores disponíveis

let str1 = "5"
let num1 = Int(str1)

struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

// Typecasting

class Animal { }
class Fish: Animal { }
class Dog: Animal {
    func makeNoise() {
        print("woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
