//
//  AspectRatio+Enum.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-13.
//

import Foundation

public enum AspectRatio: String, CaseIterable {
    case ratio16x9 = "16:9"
    case ratio9x16 = "9:16"
    case ratio1x1 = "1:1"
    case ratio4x3 = "4:3"
    case ratio21x9 = "21:9"

    var size: CGSize {
        switch self {
            case .ratio16x9: return CGSize(width: 1920, height: 1080)
            case .ratio9x16: return CGSize(width: 1080, height: 1920)
            case .ratio1x1: return CGSize(width: 1080, height: 1080)
            case .ratio4x3: return CGSize(width: 1440, height: 1080)
            case .ratio21x9: return CGSize(width: 2560, height: 1080)
        }
    }
}
