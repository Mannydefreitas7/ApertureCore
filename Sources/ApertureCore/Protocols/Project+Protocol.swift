//
//  Project+Protocol.swift
//  ApertureSDK
//
//  Created by Emmanuel on 2026-02-13.
//

import Foundation

public protocol ProjectProtocol: Identifiable {

    var id: UUID { get set }
    var name: String { get set }
    var canvasSize: CGSize.CanvasSize { get set }
    var fps: Double { get set }
    var audioSampleRate: Double { get set }
    var tracks: [Track] { get set }
    var createdAt: Date { get set }
    var modifiedAt: Date { get set }
    var resolution: Resolution { get set }
    var frameRate: Double { get set }
    var colorSpace: String { get set }
    var textOverlays: [TextOverlay] { get set }
    var transitions: [Transition] { get set }
    var globalFilter: VideoFilter? { get set }

}
