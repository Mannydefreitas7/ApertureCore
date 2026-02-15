//
//  Frame+Recipe.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-14.
//

import Foundation
import AVFoundation
import CoreImage

    /// Describes what to render at a given time
public struct FrameRecipe {
    public var time: Double
    public var clips: [(clip: Clip, image: CIImage)]
    public var canvasSize: CGSize.CanvasSize

    public init(time: Double, clips: [(clip: Clip, image: CIImage)], canvasSize: CGSize.CanvasSize) {
        self.time = time
        self.clips = clips
        self.canvasSize = canvasSize
    }
}
