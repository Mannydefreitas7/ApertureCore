//
//  Template+Protocol.swift
//  ApertureSDK
//
//  Created by Emmanuel on 2026-02-13.
//

import Foundation

public protocol TemplateProtocol: Identifiable {

    var id: UUID { get }
    var name: String { get set }
    var description: String? { get set }
    var icon: String? { get set }
    var project: Project { get set }
    var category: TemplateCategory? { get set }
    var aspectRatio: AspectRatio? { get set }
    var thumbnailURL: URL? { get set }
    var previewURL: URL? { get set }
    var tags: [String] { get set }
    var isPremium: Bool { get set }
    var author: String? { get set }
    var downloads: Int { get set }

}
