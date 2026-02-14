//
//  Project+Model.swift
//  ApertureSDK
//
//  Created by Emmanuel on 2026-02-13.
//

import Foundation

/// Represents a video editing project with tracks, overlays, and rendering metadata.
public struct Project: ProjectProtocol {

    public var id: UUID
    public var name: String
    public var canvasSize: CGSize.CanvasSize
    public var fps: Double
    public var audioSampleRate: Double
    public var tracks: [Track]
    public var createdAt: Date
    public var modifiedAt: Date
    public var resolution: Resolution
    public var frameRate: Double
    public var colorSpace: String
    public var textOverlays: [TextOverlay]
    public var transitions: [Transition]
    public var globalFilter: VideoFilter?

}
/// Represents a global video filter for a project.
///
/// Use this to apply a filter across the rendered output.
public struct VideoFilter: Identifiable {
    public var id: UUID
    public var name: String
    public var parameters: [String: Any]
    public var isEnabled: Bool

    public init(
        id: UUID = UUID(),
        name: String,
        parameters: [String: Any] = [:],
        isEnabled: Bool = true
    ) {
        self.id = id
        self.name = name
        self.parameters = parameters
        self.isEnabled = isEnabled
    }
}

