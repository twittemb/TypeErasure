import Foundation

private class AbstractCup<L: Liquid>: Cup {
    
    var liquid: L? {
        fatalError("Must implement")
    }
    
    func fill(with liquid: L) {
        fatalError("Must Implement")
    }
}

final private class CupWrapper<C: Cup>: AbstractCup<C.LiquidType> {
    var cup: C
    
    init(with cup: C) {
        self.cup = cup
    }
    
    override var liquid: C.LiquidType? {
        return self.cup.liquid
    }
    
    override func fill(with liquid: C.LiquidType) {
        self.cup.fill(with: liquid)
    }
}

final public class AnyCup<L: Liquid>: Cup {
    private let abstractCup: AbstractCup<L>
    
    public init<C: Cup>(with cup: C) where C.LiquidType == L {
        abstractCup = CupWrapper(with: cup)
    }
    
    public func fill(with liquid: L) {
        self.abstractCup.fill(with: liquid)
    }
    
    public var liquid: L? {
        return self.abstractCup.liquid
    }

}
