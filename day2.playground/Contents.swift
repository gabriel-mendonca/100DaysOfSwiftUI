
//arrays
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]

beatles[1]

//Sets
let colors = Set(["red","green","blue","yellow"])

let colors2 = Set(["red","green","blue","red","blue"])


// tuplas
var name = (first: "gabriel", last: "goncalves")

name.0

name.first


//arrays vs sets vs tuplas
let address = (house: 555, street: "avenida brasil",city: "rio de janeiro")

let set = Set(["system information","astronaut","engineer"])

let pythons = ["joao","maria","fulano","ciclano","ciclano"]


// Dicionários
let heights = [
    "cristiano ronaldo": 1.78,
    "eu": 1.82
]

heights["cristiano ronaldo"]

//valores padrao do dicionario
let favoriteIceCream = [
    "joao": "chcolate",
    "maria": "baunilha"
]

favoriteIceCream["joao"]
favoriteIceCream["charlotte"]
favoriteIceCream["charlottes", default: "unknow"]



//criação de coleções vazias

var teams = [String: String]()

teams["gabriel"] = "cruzeiro"

var results = [Int]()

var words = Set<String>()
var numbers = Set<Int>()

var scores = Dictionary<String, Int>()
var result = Array<Int>()



// enumerações
let result1 = "failure"
let results2 = "failed"
let results3 = "failed"


enum resultss {
    case sucess
    case failure
}

resultss.failure


//valores associados de Enum

enum activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = activity.talking(topic: "Football")


//valores brutos enum

enum planets: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = planets(rawValue: 3)
