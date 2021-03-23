
// Criação de fechamentos básicos


let driving = {
    print("I'm driving in my car")
}

driving()

// Aceitando parâmetros em um fechamento

let driving1 = { (place: String) in
    print("I'm going to \(place) in my car")
}

driving1("London")


// Retornando valores de um fechamento

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)

// Fechamentos como parâmetros

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel(action: driving)

// Sintaxe de encerramento final

func travel1(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel1 {
    print("I'm driving in my car")
}
