
struct Coffee: Liquid {
    let viscosity: Float = 3.4
    let color = "black"
    var temperature: Float
}

struct Water: Liquid {
    let viscosity: Float = 1.0
    let color = "transparent"
    var temperature: Float
}

struct Milk: Liquid {
    let viscosity: Float = 2.2
    let color = "white"
    var temperature: Float
}

class CeramicCup<L: Liquid>: Cup {
    var liquid: L?

    func fill(with liquid: L) {
        self.liquid = liquid
        self.liquid!.temperature -= 1
    }
}

class PlaticCup<L: Liquid>: Cup {
    var liquid: L?

    func fill(with liquid: L) {
        self.liquid = liquid
        self.liquid!.temperature -= 10
    }
}

var coffeeCups = [AnyCup<Coffee>]()
coffeeCups.append(AnyCup<Coffee>(with: CeramicCup<Coffee>()))
coffeeCups.append(AnyCup<Coffee>(with: PlaticCup<Coffee>()))

coffeeCups.forEach { (anyCup) in
    anyCup.fill(with: Coffee(temperature: 60.4))
    print (anyCup.liquid!.color)
    print (anyCup.liquid!.temperature)
}

var milkCups = [AnyCup<Milk>]()
milkCups.append(AnyCup<Milk>(with: CeramicCup<Milk>()))
milkCups.append(AnyCup<Milk>(with: PlaticCup<Milk>()))

milkCups.forEach { (anyCup) in
    anyCup.fill(with: Milk(temperature: 30.9))
    print (anyCup.liquid!.color)
    print (anyCup.liquid!.temperature)
}

//var coffeeCups2 = [GenericCup<Coffee>]()
//let cupOfCoffee = GenericCup<Coffee>(with: .small)
//cupOfCoffee.fill(with: coffee)
//coffeeCups2.append(cupOfCoffee)
//coffeeCups2[0].liquid!.color
//coffeeCups2[0].liquid!.viscosity
