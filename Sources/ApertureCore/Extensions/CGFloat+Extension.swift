//
//  CGFloat+Extension.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-14.
//
import Foundation

extension CGFloat: Interpolatable {
    static func interpolate(from: CGFloat, to: CGFloat, progress: CGFloat) -> CGFloat {
        from + (to - from) * progress
    }
}
