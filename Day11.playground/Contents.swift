// Protocolos

protocol Identifiable {
    var id: String {get set}
}

struct User: Identifiable {
    var id: String
}

func displayId(thing: Identifiable) {
    print("My id is \(thing.id)")
}

// Herança de protocolo

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTrainig {
    func study()
}

protocol HasVocation {
    func takeVocation(days: Int)
}

protocol Employee: Payable, NeedsTrainig, HasVocation { }

// Extensões

extension Int {
    func squared() -> Int {
        return self * self
    }
    
    var isEven: Bool {
        return self % 2 == 0
    }
}

let number = 8
number.squared()

// Extensões de protocolo

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
    print("There are \(count) of us:")
        
        for name in self {
            print(name)
        }
    }
}

pythons.summarize()
beatles.summarize()

// Programação orientada a protocolo

protocol Identifiable1 {
    var id: String {get set}
    func identify()
}

extension Identifiable1 {
    func identify() {
        print("My id is \(id).")
    }
}

struct User1: Identifiable1 {
    var id: String
}

let twotraws = User1(id: "twotraws")
twotraws.identify()
