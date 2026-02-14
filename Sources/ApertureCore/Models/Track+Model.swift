import Foundation
import AVFoundation

/// Represents a track in the timeline
public struct Track: Identifiable {
    public let id: UUID = UUID()
    public var type: TrackType
    public var clips: [Clip] = []
    public var isMuted: Bool = false
    public var name: String
    public var isLocked: Bool = false
    public var isVisible: Bool = true
    public var volume: Float = 1.0

    /// Total duration (in seconds) based on the last clip's end time
    public var duration: Double {
        clips.map { $0.timeRange.start + $0.timeRange.duration }.max() ?? 0
    }
}
