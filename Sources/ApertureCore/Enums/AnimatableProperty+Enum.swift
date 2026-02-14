//
//  AnimatableProperty+Enum.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-14.
//

import Foundation
import AVFoundation
import CoreGraphics

    // MARK: - Keyframe Basics

enum AnimatableProperty: String, CaseIterable, Codable, Identifiable {
    var id: String { rawValue }
    var displayName: String { rawValue }

        // Transform
    case positionX = "Position X"
    case positionY = "Position Y"
    case scale = "Scale"
    case scaleX = "Scale X"
    case scaleY = "Scale Y"
    case rotation = "Rotation"
    case anchorX = "Anchor X"
    case anchorY = "Anchor Y"
    case position = "Position"
    case anchorPoint = "Anchor Point"

        // Appearance
    case opacity = "Opacity"

        // Filter parameters
    case filterIntensity = "Filter Intensity"
    case brightness = "Brightness"
    case contrast = "Contrast"
    case saturation = "Saturation"

        // Blur
    case blurRadius = "Blur Radius"

        // Crop
    case cropLeft = "Crop Left"
    case cropRight = "Crop Right"
    case cropTop = "Crop Top"
    case cropBottom = "Crop Bottom"

    var defaultValue: CGFloat {
        switch self {
            case .positionX, .positionY, .position: return 0.5
            case .scale, .scaleX, .scaleY: return 1.0
            case .rotation: return 0
            case .anchorX, .anchorY, .anchorPoint: return 0.5
            case .opacity: return 1.0
            case .filterIntensity: return 1.0
            case .brightness: return 0
            case .contrast, .saturation: return 1.0
            case .blurRadius: return 0
            case .cropLeft, .cropRight, .cropTop, .cropBottom: return 0
        }
    }

    var range: ClosedRange<CGFloat> {
        switch self {
            case .positionX, .positionY, .position: return -1...2
            case .scale, .scaleX, .scaleY: return 0.01...10
            case .rotation: return -360...360
            case .anchorX, .anchorY, .anchorPoint: return 0...1
            case .opacity: return 0...1
            case .filterIntensity: return 0...2
            case .brightness: return -1...1
            case .contrast, .saturation: return 0...3
            case .blurRadius: return 0...100
            case .cropLeft, .cropRight, .cropTop, .cropBottom: return 0...0.5
        }
    }
}
