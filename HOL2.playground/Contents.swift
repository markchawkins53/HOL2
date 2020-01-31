import UIKit

struct Pizza {
    var size: Int = 0
    var hasExtraCheese: Bool = false
}

//Class that takes in a delegate. The delegate is another class that holds additional functions for the main class
class Bakery {
    var delegate: BakeryDelegate?
    
    func preparePizza() {
        var pizza = Pizza()
        pizza.size = 6
        pizza.hasExtraCheese = true
        
        delegate?.pizzaWasBaked(pizza)
    }
    
}

//Acts like an interface. A contract for a class that requires it to have certain functions
protocol BakeryDelegate {
    
    func pizzaWasBaked (_ pizza: Pizza)
}


//Class that implements the BakeryDelgate
class PizzaShop: BakeryDelegate {
    
    func pizzaWasBaked(_ pizza: Pizza) {
        print("Pizza was baked hurray!!!")
    }
    
}

//Instantiate the PizzaShop
let shop = PizzaShop()

//Instantiate the Bakery
let bakery = Bakery()

//Assign the delegate (BakeryDelegate) to the shop
//Since shop implements BakeryDelegate, it is able to assigned to the variable
bakery.delegate = shop

//Call the prepare pizza function from the main class
//The function called was instantiated from PizzaShop()
bakery.preparePizza()
