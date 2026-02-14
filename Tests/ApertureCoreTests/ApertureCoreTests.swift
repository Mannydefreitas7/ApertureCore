import Testing
@testable import ApertureCore

@MainActor
@Test func timeRangeCalculations() async throws {
    let range = DummyData.timeRange
    #expect(range.end == 4.0)
    #expect(range.contains(1.0))
    #expect(!range.contains(5.0))
}

@MainActor
@Test func captionTrackSRTConversion() async throws {
    let track = DummyData.captionTrack
    let srt = track.toSRT()
    let roundTrip = CaptionTrack.fromSRT(srt)

    #expect(roundTrip.captions.count == track.captions.count)
    #expect(roundTrip.captions.first?.text == track.captions.first?.text)
}

@MainActor
@Test func trackDurationMatchesClips() async throws {
    let track = DummyData.track
    let expectedDuration = track.clips.reduce(0) { $0 + $1.timeRange.duration }

    #expect(track.totalDuration == expectedDuration)
}

@MainActor
@Test func clipSplitProducesTwoClips() async throws {
    let clip = DummyData.videoClip
    let split = clip.split(at: 1.0)

    #expect(split != nil)
    #expect(split?.0.timeRange.duration == 1.0)
    #expect(split?.1.timeRange.duration == clip.timeRange.duration - 1.0)
}

@MainActor
@Test func templateHoldsProject() async throws {
    let template = DummyData.template

    #expect(template.project.name == "Demo Project")
    #expect(template.category == .promo)
}

