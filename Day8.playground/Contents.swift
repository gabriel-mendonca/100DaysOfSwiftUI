
// Criando suas próprias estruturas

struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

tennis.name = "Nike tennis"

// Propriedades computadas

struct Sport1 {
    var name: String
    var isOlympicSport: Bool
    
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport "
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport1(name: "chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

// Observadores de propriedade

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

// Métodos

struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
london.collectTaxes()

// Métodos mutantes

struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "anonymous"
    }
}

var person = Person(name: "Ed")
person.makeAnonymous()

// Propriedades e métodos de strings

let string = "Do or do not, there is no try."

/// ler o numero de caracteres de uma string
print(string.count)

/// Eles têm um hasPrefix()método que
/// retorna verdadeiro se a string começar com letras específicas:
print(string.hasPrefix("Do"))

///Você pode colocar uma string em maiúsculas chamando seu uppercased()
print(string.uppercased())

///E você pode até mesmo fazer com que o Swift classifique as letras da string em uma matriz
print(string.sorted())

// Propriedades e métodos de matrizes

var toys = ["woody"]

/// Você pode ler o número de itens em uma matriz usando sua count
print(toys.count)

/// Se você quiser adicionar um novo item, use o append()
print(toys.append("Buzz"))

/// Você pode localizar qualquer item dentro de uma matriz usando seu firstIndex()
print(toys.firstIndex(of: "Buzz") as Any)

/// classificar em ordem alfabetica
print(toys.sorted())

/// se você deseja remover um item, use o remove()
print(toys.remove(at: 0))
