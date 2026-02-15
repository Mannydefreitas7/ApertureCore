//
//  Untitled.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-14.
//
import SwiftUI

protocol Interpolatable {
    static func interpolate(from: Self, to: Self, progress: CGFloat) -> Self
}
