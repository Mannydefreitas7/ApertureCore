//
//  CaptionStyle+Ptrotocol.swift
//  ApertureSDK
//
//  Created by Emmanuel on 2026-02-13.
//

import Foundation
import CoreGraphics

public protocol CaptionStyle: Identifiable {

    associatedtype CaptionStyleType: Hashable

    var id: UUID { get }
    var type: CaptionStyleType { get set }
    var color: CGColor { get set }
    var fontSize: CGFloat { get set }
    var position: CGFloat { get set }  // 0-1, vertical position
    var speed: CGFloat { get set }
    var offset: CGFloat { get set }  // Offset along path
    var animated: Bool { get set }
    var animationDuration: Double? { get set }
}
