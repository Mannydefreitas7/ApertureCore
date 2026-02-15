//
//  BeatInfo.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-14.
//

import Foundation
import CoreMedia

// MARK: - Beat Detection

public struct BeatInfo {
    public var time: CMTime
    public var strength: Float
    public var tempo: Double  // BPM

    public init(time: CMTime, strength: Float, tempo: Double) {
        self.time = time
        self.strength = strength
        self.tempo = tempo
    }
}
