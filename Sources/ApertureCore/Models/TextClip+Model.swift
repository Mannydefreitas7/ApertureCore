import Foundation

/// Text content for text clips
public struct TextClip: Identifiable {
    public let id: UUID = UUID()
    public var text: String
    public var fontName: String
    public var fontSize: Double
    public var colorHex: String
    public var backgroundColorHex: String?
    public var alignment: Alignment
    public var animation: Animation?
    
    public enum Alignment: String, Codable {
        case left, center, right
    }
    
    public enum Animation: String, Codable {
        case fadeIn, fadeOut, fadeInOut
    }
}
