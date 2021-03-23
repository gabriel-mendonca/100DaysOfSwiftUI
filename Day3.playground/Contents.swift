
// Operadores aritméticos
let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore

let remainder = 13 % secondScore

//sobrecarga do operador

let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "fakers gonna"
let action = fakers + "fake"

let firstHalf = ["john", "thiago"]
let secondHalf = ["george","gabriel"]

let people = firstHalf + secondHalf


// operadores de atribuição compostos

var score = 95
score -= 5

var quote = "the rain in spain falls mainly on the"
quote += "Spaniards"


// operadores de comparação

let firstScore1 = 6
let secondScore1 = 4

firstScore1 == secondScore1
firstScore1 != secondScore1

firstScore1 < secondScore1
firstScore1 >= secondScore1

"taylor" <= "Swift"


// Condições

let firstCard = 10
let secondCard = 11

if firstCard + secondCard == 2 {
    print("Aces - Lucky!")
} else if firstCard + secondCard == 21 {
    print("blackjack!")
} else {
    print("regular cards")
}


// Condições de combinação

let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}


// Operador ternário

let firstCard1 = 11
let secondCard2 = 10

print(firstCard1 == secondCard2 ? "Cards are the same" : "Cards are different")

///poderiamos escrever esse mesmo codigo usando uma condição regular

if firstCard1 == secondCard2 {
    print("Cards are the same")
} else {
    print("Cards are different")
}









// Mudar declarações

let weather = "sunny"

switch weather {
case "rain":
    print("bring an umbrella")
case "snow":
    print("wrap up warm")
case "sunny":
    print("wear sunscreen")
default:
    print("enjoy your day!")
}

/// se você deseja que a execução continue no proximo caso, use a fallthrough:

switch weather {
case "rain":
    print("bring an umbrella")
case "snow":
    print("wrap up warm")
case "sunny":
    print("wear sunscreen")
    fallthrough
default:
    print("enjoy your day!")
}


// Operadores de alcance

let score1 = 85

switch score1 {
case 0..<50:
    print("you failed badly.")
case 50..<85:
    print("you did OK.")
default:
    print("you did great!")
}

