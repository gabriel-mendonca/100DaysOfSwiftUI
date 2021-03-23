
// funções de escrita

func printHelp() {
    let message = """
    welcome to myApp!
    
    Run this app inside a directory
    of images and MyApp will risize
    them all into thumbnails
    
    """
    
    print(message)
}

printHelp()


// aceitando parâmetros

func square(number: Int) {
    print(number * number)
}

square(number: 8)

// Retornando valores

func square1(number: Int) -> Int {
    return number * number
}

let result = square1(number: 8)
print(result)

/// Se você precisar retornar vários valores,
/// este é um exemplo perfeito de quando usar tuplas.


// Rótulos de parâmetros

func sayHello(to name: String) {
    print("hello, \(name)!")
}

sayHello(to: "Gabriel")


// Omitindo rótulos de parâmetros

func greet(_ person: String) {
    print("hello, \(person)!")
}

greet("gabriel")


// Parâmetros padrão

func greet1(person: String, nicely: Bool = true) {
    if nicely == true {
        print("hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

greet1(person: "gabriel")
greet1(person: "gabriel", nicely: false)


// Funções variáveis

func square2(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square2(numbers: 1,2,3,4,5)


// Escrevendo funções de arremesso

enum passwordError: Error {
    case obvious
}

func checkPassword(password: String) throws -> Bool {
    if password == "password" {
        throw passwordError.obvious
    }
    
    return true
}

// Executando funções de arremesso

do {
    try checkPassword(password: "password")
    print("that password is good!")
} catch {
    print("you can't use that password")
}

// parâmetros inout

func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)
