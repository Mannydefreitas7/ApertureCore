//
//  EasingFunction+Enum.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-14.
//

import SwiftUI

public enum EasingFunction: String, CaseIterable, Codable {
    case linear = "Linear"
    case easeIn = "Ease In"
    case easeOut = "Ease Out"
    case easeInOut = "Ease In Out"
    case easeInQuad = "Ease In Quad"
    case easeOutQuad = "Ease Out Quad"
    case easeInOutQuad = "Ease In Out Quad"
    case easeInCubic = "Ease In Cubic"
    case easeOutCubic = "Ease Out Cubic"
    case easeInOutCubic = "Ease In Out Cubic"
    case easeInElastic = "Elastic In"
    case easeOutElastic = "Elastic Out"
    case easeInBounce = "Bounce In"
    case easeOutBounce = "Bounce Out"
    case spring = "Spring"
    case bounce = "Bounce"

    func apply(_ t: CGFloat) -> CGFloat {
        switch self {
            case .linear:
                return t
            case .easeIn:
                return t * t
            case .easeOut:
                return 1 - (1 - t) * (1 - t)
            case .easeInOut:
                if t < 0.5 { return 2 * t * t } else { return 1 - pow(-2 * t + 2, 2) / 2 }
            case .spring:
                let damping: CGFloat = 0.5
                let stiffness: CGFloat = 8.0
                return 1 - exp(-stiffness * t) * cos(10 * .pi * t) * (1 - damping)
            case .bounce:
                if t < 4/11.0 { return (121 * t * t)/16.0 }
                else if t < 8/11.0 { return (363/40.0 * t * t) - (99/10.0 * t) + 17/5.0 }
                else if t < 9/10.0 { return (4356/361.0 * t * t) - (35442/1805.0 * t) + 16061/1805.0 }
                else { return (54/5.0 * t * t) - (513/25.0 * t) + 268/25.0 }
            default:
                return 0
        }
    }

    func value(at t: CGFloat) -> CGFloat {
        let t = max(0, min(1, t))

        switch self {
            case .linear:
                return t
            case .easeIn:
                return t * t * t
            case .easeOut:
                return 1 - pow(1 - t, 3)
            case .easeInOut:
                return t < 0.5 ? 4 * t * t * t : 1 - pow(-2 * t + 2, 3) / 2
            case .easeInQuad:
                return t * t
            case .easeOutQuad:
                return 1 - (1 - t) * (1 - t)
            case .easeInOutQuad:
                return t < 0.5 ? 2 * t * t : 1 - pow(-2 * t + 2, 2) / 2
            case .easeInCubic:
                return t * t * t
            case .easeOutCubic:
                return 1 - pow(1 - t, 3)
            case .easeInOutCubic:
                return t < 0.5 ? 4 * t * t * t : 1 - pow(-2 * t + 2, 3) / 2
            case .easeInElastic:
                if t == 0 { return 0 }
                if t == 1 { return 1 }
                return -pow(2, 10 * t - 10) * sin((t * 10 - 10.75) * (2 * .pi) / 3)
            case .easeOutElastic:
                if t == 0 { return 0 }
                if t == 1 { return 1 }
                return pow(2, -10 * t) * sin((t * 10 - 0.75) * (2 * .pi) / 3) + 1
            case .easeInBounce:
                return 1 - EasingFunction.easeOutBounce.value(at: 1 - t)
            case .easeOutBounce:
                if t < 1 / 2.75 {
                    return 7.5625 * t * t
                } else if t < 2 / 2.75 {
                    let t = t - 1.5 / 2.75
                    return 7.5625 * t * t + 0.75
                } else if t < 2.5 / 2.75 {
                    let t = t - 2.25 / 2.75
                    return 7.5625 * t * t + 0.9375
                } else {
                    let t = t - 2.625 / 2.75
                    return 7.5625 * t * t + 0.984375
                }
            case .spring:
                let decay: CGFloat = 0.5
                let frequency: CGFloat = 3
                return 1 - exp(-decay * t * 10) * cos(frequency * t * .pi * 2)
            default:
                return 0
        }
    }

    var displayName: String {
        switch self {
            case .linear: return "Linear"
            case .easeIn: return "Ease In"
            case .easeOut: return "Ease Out"
            case .easeInOut: return "Ease In-Out"
            case .spring: return "Spring"
            case .bounce: return "Bounce"
            case .easeInQuad: return "Ease In Quad"
            default:
                return "temp"
        }
    }

    static var defaultCases: [EasingFunction] { [.linear, .easeIn, .easeOut, .easeInOut, .spring, .bounce] }
}

