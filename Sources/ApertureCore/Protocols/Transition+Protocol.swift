//
//  Transition+Protocol.swift
//  ApertureSDK
//
//  Created by Emmanuel on 2026-02-13.
//

import Foundation

public protocol TransitionProtocol: Identifiable {

    var id: UUID { get set }
    var type: TransitionType { get set }
    var duration: Double { get set } // seconds
    var parameters: [String: Double]? { get set }
    /// Application-side clip IDs (optional, for rendering)
    var fromClipId: UUID? { get set }
    var toClipId: UUID? { get set }

}
