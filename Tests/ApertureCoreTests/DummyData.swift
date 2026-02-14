import CoreGraphics
import CoreMedia
@testable import ApertureCore

@MainActor
enum DummyData {}

// MARK: - Enums
extension DummyData {
    static let resolution: Resolution = .p1080x720
    static let aspectRatio: AspectRatio = .ratio16x9
    static let templateCategory: TemplateCategory = .promo
    static let placeholderType: PlaceholderType = .text
    static let timeRange = TimeRange(start: 1.0, duration: 3.0)
}

// MARK: - Captions
extension DummyData {
    static let caption = Caption(
        index: 1,
        startTime: 0.5,
        endTime: 2.5,
        text: "Hello, world!"
    )
    static let captionTrack = CaptionTrack(captions: [caption])
}

// MARK: - Effects
extension DummyData {
    static let effect = Effect(
        name: "Sepia",
        type: .sepia,
        parameters: ["intensity": 0.8],
        isEnabled: true
    )
    static let filterPreset = FilterPreset(
        name: "Warm",
        filterName: "CISepiaTone",
        parameters: ["inputIntensity": 0.7]
    )
}

// MARK: - Text Clips
extension DummyData {
    static let textClipContent = TextClip(
        text: "Title Card",
        fontName: "Helvetica-Bold",
        fontSize: 42,
        colorHex: "#FFFFFF",
        backgroundColorHex: "#000000",
        alignment: .center,
        animation: .fadeInOut
    )
}

// MARK: - Clips
extension DummyData {
    static let clipTransform = Clip.Transform(
        positionX: 0.5,
        positionY: 0.5,
        scaleX: 1.0,
        scaleY: 1.0,
        rotation: 0,
        anchorX: 0.5,
        anchorY: 0.5
    )

    static let videoClip = Clip(
        type: .video,
        timeRange: timeRange,
        sourceURL: URL(string: "file:///tmp/sample.mov"),
        sourceAssetId: "asset-001",
        transform: clipTransform,
        opacity: 1.0,
        volume: 0.9,
        effects: [effect],
        isMuted: false,
        textContent: nil,
        subTimeline: nil
    )

    static let textClip = Clip(
        type: .text,
        timeRange: TimeRange(start: 0, duration: 2.0),
        sourceURL: nil,
        sourceAssetId: nil,
        transform: clipTransform,
        opacity: 1.0,
        volume: 0,
        effects: [],
        isMuted: true,
        textContent: textClipContent,
        subTimeline: nil
    )
}

// MARK: - Tracks
extension DummyData {
    static let track = Track(
        type: .video,
        clips: [videoClip, textClip],
        isMuted: false,
        name: "Video 1",
        isLocked: false,
        isVisible: true,
        volume: 1.0
    )
}

// MARK: - Overlays
extension DummyData {
    static let textOverlay = TextOverlay(
        startTime: CMTime(seconds: 1.0, preferredTimescale: 600),
        duration: CMTime(seconds: 2.0, preferredTimescale: 600),
        position: CGPoint(x: 120, y: 200),
        text: "Overlay",
        fontName: "Helvetica",
        fontSize: 32,
        color: CGColor(red: 1, green: 1, blue: 1, alpha: 1)
    )
}

// MARK: - Transitions
extension DummyData {
    static let transition = Transition(
        type: .crossDissolve,
        duration: 0.6,
        parameters: ["softness": 0.8],
        fromClipId: videoClip.id,
        toClipId: textClip.id
    )
}

// MARK: - Filters
extension DummyData {
    static let videoFilter = VideoFilter(
        name: "Cinematic",
        parameters: ["contrast": 1.1, "saturation": 0.9],
        isEnabled: true
    )
}

// MARK: - Projects
extension DummyData {
    static let project = Project(
        id: UUID(),
        name: "Demo Project",
        canvasSize: .hd1080p,
        fps: 30,
        audioSampleRate: 44_100,
        tracks: [track],
        createdAt: Date(timeIntervalSince1970: 1_700_000_000),
        modifiedAt: Date(timeIntervalSince1970: 1_700_000_600),
        resolution: resolution,
        frameRate: 30,
        colorSpace: "BT.709",
        textOverlays: [textOverlay],
        transitions: [transition],
        globalFilter: videoFilter
    )
}

// MARK: - Templates
extension DummyData {
    static let template = Template(
        name: "Promo Pack",
        description: "A simple promo template.",
        icon: "sparkles",
        project: project,
        category: templateCategory,
        aspectRatio: aspectRatio,
        thumbnailURL: URL(string: "https://example.com/thumb.png"),
        previewURL: URL(string: "https://example.com/preview.mov"),
        tags: ["promo", "product"],
        isPremium: false,
        author: "Aperture",
        downloads: 128
    )
}
