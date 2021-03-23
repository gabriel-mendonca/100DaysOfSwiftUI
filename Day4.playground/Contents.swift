
// for loops
let count = 1...10

for number in count {
    print("numbers is \(number)")
}


let albums = ["red","1989","Reputation"]
for album in albums {
    print("\(album) in on apple music")
}

for _ in 1...5 {
    print("play")
}


// loops while

var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("ready or not, here I come!")


// repetir loops

var number1 = 1

repeat {
    print(number1)
    number1 += 1
} while number1 <= 20

print("ready or not, here I come!")

///Como a condição vem no final do repeat loop,
///o código dentro do loop sempre será executado pelo menos uma vez,
///enquanto os while loops verificam sua condição antes da primeira execução.

///exemplo:
while false {
    print("this is false")
}

repeat {
    print("this is false")
} while false












// saindo de loops
var countDown = 10

while countDown >= 0 {
    print(countDown)
    countDown -= 1
}

print("blast off!")

while countDown >= 0 {
    if countDown == 4 {
        print("I'm bored.let's go now!")
        break
    }
    countDown -= 1
}








// saindo de varios loops

for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
    }
}

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product1 = i * j
        print("\(i) * \(j) is \(product1)")
        
        if product1 == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}







// pular itens

for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    
    print(i)
}


// loops infinitos

var counter = 0

while true {
    print(" ")
    counter += 1
    if counter == 273 {
        break
    }
}

