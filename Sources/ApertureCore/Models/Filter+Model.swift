//
//  Filter+Model.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-13.
//

import Foundation

// MARK: - Filter Presets

struct FilterPreset: Identifiable, Codable {
    let id: UUID
    var name: String
    var filterName: String
    var parameters: [String: Double]

    init(id: UUID = UUID(), name: String, filterName: String, parameters: [String: Double] = [:]) {
        self.id = id
        self.name = name
        self.filterName = filterName
        self.parameters = parameters
    }
}
