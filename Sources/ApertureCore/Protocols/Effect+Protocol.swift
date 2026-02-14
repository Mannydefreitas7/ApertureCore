#if canImport(AVFoundation)
import Foundation
import AVFoundation

/// Protocol for video effects
public protocol EffectProtocol: Identifiable {

    associatedtype EffectType

    var id: UUID { get }
    var name: String { get }
    var type: EffectType { get }
    var parameters: [String: Any] { get set }
    var isEnabled: Bool { get set }
    func apply(to composition: AVVideoComposition.Configuration) -> AVVideoComposition.Configuration
}
#endif
