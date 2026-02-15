//
//  Asset+Extension.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-14.
//

import AVFoundation

extension Asset {

        /// Trim the video to a specific time range
        /// - Parameters:
        ///   - start: The start time
        ///   - end: The end time
        /// - Throws: ApertureError if the time range is invalid
    public func trim(start: CMTime, end: CMTime) throws {
        guard start >= .zero && end <= duration && start < end else {
            throw ApertureError.invalidTimeRange
        }
        self.avAsset.startTime = start
        self.endTime = end
    }

        /// Apply an effect to the video
        /// - Parameter effect: The effect to apply
    public func applyEffect(_ effect: any EffectProtocol) {
        effects.append(effect)
    }

        /// Add an overlay to the video
        /// - Parameter overlay: The overlay to add
    public func addOverlay(_ overlay: any OverlayProtocol) {
        overlays.append(overlay)
    }

        /// Get all applied effects
    public func getEffects() -> [any EffectProtocol] {
        return effects
    }

        /// Get all overlays
    public func getOverlays() -> [any OverlayProtocol] {
        return overlays
    }

        /// Get the trimmed duration
    public var trimmedDuration: CMTime {
        return CMTimeSubtract(endTime, startTime)
    }

        /// Generate a thumbnail at a specific time
        /// - Parameter time: The time to generate the thumbnail
        /// - Returns: A CGImage thumbnail
    @available(iOS 16, macOS 13, *)
    public func generateThumbnail(at time: CMTime) async throws -> CGImage {
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        imageGenerator.appliesPreferredTrackTransform = true
        imageGenerator.requestedTimeToleranceAfter = .zero
        imageGenerator.requestedTimeToleranceBefore = .zero

        let cgImage = try await imageGenerator.image(at: time).image
        return cgImage
    }

}
