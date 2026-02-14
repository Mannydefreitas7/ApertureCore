//
//  Visualization+Model.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-14.
//

import Foundation

public struct AudioVisualization {
    public var type: Wave
    public var sensitivity: Float = 1.0
    public var smoothing: Float = 0.8
    public var barCount: Int = 64
    public var mirrorMode: Bool = false

}
