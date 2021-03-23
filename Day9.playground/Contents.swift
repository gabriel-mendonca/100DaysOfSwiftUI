
// Inicializadores

struct User {
    var username: String
    
    init() {
        username = "anonymous"
        print("Creating new user!")
    }
}

var user = User()
user.username = "twostraws"

// Referindo-se à instância atual

struct Person {
    var name: String
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

// Propriedades preguiçosas

struct FamilyTree {
    init() {
        print("creating family tree!")
    }
}

struct Person1 {
    var name: String
    lazy var familyTree = FamilyTree()
    init(name: String) {
        self.name = name
    }
}
var ed = Person1(name: "Ed")
ed.familyTree

// Propriedades e métodos estáticos

struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let ed1 = Student(name: "Ed")
let taylor = Student(name: "Taylor")

print(Student.classSize)

// Controle de acesso

struct Person2 {
   private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "my social security number is \(id)"
    }
}

let ed2 = Person(name: "12345")
