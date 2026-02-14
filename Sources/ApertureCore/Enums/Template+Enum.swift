//
//  Template+Enum.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-13.
//
import Foundation

public enum TemplateCategory: String, CaseIterable {
    case intro = "Intro"
    case outro = "Outro"
    case vlog = "Vlog"
    case travel = "Travel"
    case food = "Food"
    case fitness = "Fitness"
    case wedding = "Wedding"
    case birthday = "Birthday"
    case holiday = "Holiday"
    case christmas = "Christmas"
    case newYear = "New Year"
    case valentines = "Valentine's Day"
    case ecommerce = "E-commerce"
    case education = "Education"
    case corporate = "Corporate"
    case social = "Social"
    case gaming = "Gaming"
    case music = "Music"
    case sports = "Sports"
    case news = "News"
    case slideshow = "Slideshow"
    case promo = "Promo"
    case custom = "Custom"

    var displayName: String { rawValue }

    var icon: String {
        switch self {
            case .intro: return "play.rectangle"
            case .outro: return "stop.rectangle"
            case .vlog: return "video"
            case .travel: return "airplane"
            case .food: return "fork.knife"
            case .fitness: return "figure.run"
            case .wedding: return "heart.fill"
            case .birthday: return "gift"
            case .holiday, .christmas, .newYear, .valentines: return "sparkles"
            case .ecommerce: return "cart"
            case .education: return "book"
            case .corporate: return "building.2"
            case .social: return "person.2"
            case .gaming: return "gamecontroller"
            case .music: return "music.note"
            case .sports: return "sportscourt"
            case .news: return "newspaper"
            case .slideshow: return "photo.on.rectangle"
            case .promo: return "megaphone"
            case .custom: return "square.grid.2x2"
        }
    }
}
