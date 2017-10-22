import Foundation

public class GenericCup<L: Liquid>: Cup {
    
    public var liquid: L?
        
    public func fill(with liquid: L) {
        self.liquid = liquid
    }
}
