//
//  Template+Model.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-13.
//

import Foundation

public struct Template: TemplateProtocol {
    public var id: UUID

    public var name: String

    public var description: String?

    public var icon: String?

    public var project: Project

    public var category: TemplateCategory?

    public var aspectRatio: AspectRatio?
    public var thumbnailURL: URL?
    public var previewURL: URL?
    public var tags: [String]
    public var isPremium: Bool
    public var author: String?
    public var downloads: Int

    public init(
        id: UUID = UUID(),
        name: String,
        description: String? = nil,
        icon: String? = nil,
        project: Project,
        category: TemplateCategory? = nil,
        aspectRatio: AspectRatio? = nil,
        thumbnailURL: URL? = nil,
        previewURL: URL? = nil,
        tags: [String] = [],
        isPremium: Bool = false,
        author: String? = nil,
        downloads: Int = 0
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.icon = icon
        self.project = project
        self.category = category
        self.aspectRatio = aspectRatio
        self.thumbnailURL = thumbnailURL
        self.previewURL = previewURL
        self.tags = tags
        self.isPremium = isPremium
        self.author = author
        self.downloads = downloads
    }

}
