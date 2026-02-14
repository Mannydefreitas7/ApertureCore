//
//  Resolution+Enum.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-13.
//

import Foundation

public enum Resolution: String {
    case p360x240
    case p480x360
    case p720x480
    case p1080x720
    case p1440x900
    case p2160x1296

    var rate : Double {
        switch self {
            case .p360x240:
                return 0.36
            case .p480x360:
                return 0.48
            case .p720x480:
                return 0.72
            case .p1080x720:
                return 1.08
            case .p1440x900:
                return 1.44
            default:
                return 2.16
        }
    }
}
