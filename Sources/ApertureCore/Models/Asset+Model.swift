//
//  Asset+Model.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-14.
//
import Foundation
import AVFoundation
import CoreImage

public struct Asset: Identifiable {
    public let id: UUID
    public let url: URL
    public private(set) var duration: CMTime
    public var startTime: CMTime
    public var endTime: CMTime
    public var volume: Float

    private var effects: [any EffectProtocol] = []
    private var overlays: [any OverlayProtocol] = []
    private let asset: AVAsset

        /// Initialize a video asset from a URL
        /// - Parameter url: The URL of the video file
        /// - Throws: ApertureError if the asset cannot be loaded
    public init(url: URL) async throws {
        self.id = UUID()
        self.url = url
        self.asset = AVURLAsset(url: url)
        self.volume = 1.0

            // Load asset properties
        let isPlayable = try await asset.load(.isPlayable)
        guard isPlayable else {
            throw ApertureError.invalidAsset
        }

        let duration = try await asset.load(.duration)
        self.duration = duration
        self.startTime = .zero
        self.endTime = duration
    }

        /// Get the underlying AVAsset
    public var avAsset: AVAsset {
        return asset
    }

 
}
