import Foundation

public protocol Cup {
    associatedtype LiquidType: Liquid
    
    var liquid: LiquidType? { get }

    func fill (with liquid: LiquidType)
}
