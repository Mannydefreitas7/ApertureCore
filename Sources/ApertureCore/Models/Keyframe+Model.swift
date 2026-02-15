//
//  Keyframe.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-14.
//
import Foundation
import CoreMedia
import AVFoundation
import CoreGraphics

struct Keyframe<T: Interpolatable>: Identifiable, Equatable where T: Equatable {
    let id: UUID
    var time: CMTime
    var value: T
    var easing: EasingFunction

    init(
        id: UUID = UUID(),
        time: CMTime,
        value: T,
        easing: EasingFunction = .linear
    ) {
        self.id = id
        self.time = time
        self.value = value
        self.easing = easing
    }

    static func == (lhs: Keyframe<T>, rhs: Keyframe<T>) -> Bool {
        lhs.id == rhs.id
    }
}
