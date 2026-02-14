//
//  Effect+Model.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-13.
//

import Foundation
import AVFoundation

/// A configurable video effect applied during composition.
public struct Effect: EffectProtocol {

    /// Effect type used by this model.
    public typealias EffectType = Self.AdjustmentType

    /// Stable identifier for the effect.
    public var id: UUID

    /// Display name for UI or debugging.
    public var name: String

    /// Effect type used when applying adjustments.
    public var type: EffectType

    /// Arbitrary parameter payload for effect configuration.
    public var parameters: [String: Any]

    /// Indicates whether the effect is active.
    public var isEnabled: Bool

    /// Creates a new effect instance.
    public init(
        id: UUID = UUID(),
        name: String,
        type: EffectType,
        parameters: [String: Any] = [:],
        isEnabled: Bool = true
    ) {
        self.id = id
        self.name = name
        self.type = type
        self.parameters = parameters
        self.isEnabled = isEnabled
    }

    /// Applies the effect to a video composition configuration.
    public func apply(to composition: AVVideoComposition.Configuration) -> AVVideoComposition.Configuration {
        //
        return composition
    }

}
