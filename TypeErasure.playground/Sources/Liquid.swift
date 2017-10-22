import Foundation

public protocol Liquid {
    var temperature: Float { get set }
    var viscosity: Float { get }
    var color: String { get }
}
