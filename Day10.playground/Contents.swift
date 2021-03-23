
// Criando suas próprias classes

class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let poppy = Dog(name: "Poppy", breed: "poodle")

// Herança de classe

class Poodle: Dog {
    init(name:String) {
        super.init(name: name, breed: "poodle")
    }
}

// Métodos de substituição

class Dog1 {
    func makeNoise() {
        print("woof!")
    }
}

class Poodle1 : Dog1 {
    override func makeNoise() {
        print("Yip!")
    }
}

let poppy1 = Dog1()
poppy1.makeNoise()

// class final

final class Dog2 {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// Copiando objetos

class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Gusttavo lima"
print(singer.name)

// Desinicializadores

class Person {
    var name = "John Doe"
    
    init() {
        print("\(name) is alive!")
    }
    
    deinit {
        print("\(name) is no more!")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

// Mutabilidade

class Person1 {
    
///se quiser impedir alteracoes
/// da propriedade name, é so tornar ela constante
    var name = "Taylor Swift"
    ///constante:
    let name1 = "Taylor Swift"
}

let taylor = Person1()
taylor.name = "Ed Sheeran"
print(taylor.name)
