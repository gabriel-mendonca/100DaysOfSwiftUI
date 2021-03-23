
// Usando fechamentos como
//parâmetros quando eles aceitam parâmetros


func travel(action:(String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel { (place: String) in
    print("I'm going to \(place) in my car")
}


// Usando fechamentos como parâmetros
//quando eles retornam valores

func travel1(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel1 { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

// Nomes de parâmetros abreviados

func travel3(action: (String) -> String) {
    print("I'm getting ready to go.")
    let descrption = action("London")
    print(descrption)
    print("I arrived!")
}

travel3 {
     "I'm going to \($0) in my car"
}

// Fechamentos com vários parâmetros

func travel4(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

travel4 {
    "I'm going to \($0) at \($1) milesper hour."
}

// Retornando fechamentos de funções

func travel5() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result = travel5()
result("London")

let result2 = travel5()("London")

// Capturando valores


func travel6() -> (String) -> Void {
    return {
        var counter = 1
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let results = travel6()

results("London")
results("New York")
results("Spain")
