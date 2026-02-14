import Foundation
import AVFoundation

/// Represents a transition between two clips
public struct Transition: TransitionProtocol {

    public var id: UUID = UUID()
    public var type: TransitionType
    public var duration: Double // seconds
    public var parameters: [String: Double]?

    /// Application-side clip IDs (optional, for rendering)
    public var fromClipId: UUID?
    public var toClipId: UUID?


}
