//
//  CGPoint+Extension.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-14.
//

import Foundation

extension CGPoint: Interpolatable {
    static func interpolate(from: CGPoint, to: CGPoint, progress: CGFloat) -> CGPoint {
        CGPoint(
            x: CGFloat.interpolate(from: from.x, to: to.x, progress: progress),
            y: CGFloat.interpolate(from: from.y, to: to.y, progress: progress)
        )
    }
}

