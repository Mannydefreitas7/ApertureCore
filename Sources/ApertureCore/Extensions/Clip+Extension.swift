//
//  Clip+Extension.swift
//  ApertureSDK
//
//  Created by Emmanuel on 2026-02-13.
//

import Foundation

extension Clip {

    public struct Transform {
            /// X position (normalized 0-1, center = 0.5)
        public var positionX: Double
            /// Y position (normalized 0-1, center = 0.5)
        public var positionY: Double
            /// Scale factor (1.0 = 100%)
        public var scaleX: Double
            /// Scale factor (1.0 = 100%)
        public var scaleY: Double
            /// Rotation in degrees
        public var rotation: Double
            /// Anchor point X (normalized 0-1)
        public var anchorX: Double
            /// Anchor point Y (normalized 0-1)
        public var anchorY: Double
    }

    /// Create a compound clip from a list of clips
    ///
    /// Groups the provided clips into a single compound clip whose `subTimeline`
    /// contains one track holding the clips. The compound clip's `timeRange`
    /// duration equals the sum of the grouped clips' durations.
    ///
    /// - Parameters:
    ///   - clips: Clips to group.
    ///   - trackType: Track type for the inner track (default `.video`).
    /// - Returns: A compound clip, or `nil` if `clips` is empty.
    public static func makeCompound(
        from clips: [Clip],
        trackType: Track.TrackType = .video
    ) -> Clip? {
        guard !clips.isEmpty else { return nil }

        let totalDuration = clips.reduce(0) { $0 + $1.timeRange.duration }
        let innerTrack = Track(type: trackType, clips: clips, name: Track.newProjectName)

        return Clip(
            type: .compound,
            timeRange: TimeRange(start: 0, duration: totalDuration),
            sourceURL: nil,
            sourceAssetId: nil,
            transform: Transform(
                positionX: 0.5,
                positionY: 0.5,
                scaleX: 1.0,
                scaleY: 1.0,
                rotation: 0,
                anchorX: 0.5,
                anchorY: 0.5
            ),
            opacity: 1.0,
            volume: 1.0,
            effects: [],
            isMuted: false,
            textContent: nil,
            subTimeline: [innerTrack]
        )
    }

    /// Trim the clip to new start/duration
    public mutating func trim(start: Double, duration: Double) {
        self.timeRange = TimeRange(start: start, duration: duration)
    }

    /// Split the clip at a given time offset from clip start, returning two clips
    public func split(at offset: Double) -> (Clip, Clip)? {
        guard offset > 0 && offset < timeRange.duration else { return nil }

        var first = self
        first.timeRange = TimeRange(start: timeRange.start, duration: offset)

        var second = self
        second.timeRange = TimeRange(start: timeRange.start + offset, duration: timeRange.duration - offset)

        return (first, second)
    }

    /// Total duration of the sub-timeline (for compound clips)
    public var subTimelineDuration: Double {
        subTimeline?.map { $0.totalDuration }.max() ?? 0
    }

}
