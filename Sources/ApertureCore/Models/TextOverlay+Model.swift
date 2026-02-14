//
//  TextOverlay+Model.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-13.
//

import Foundation
import CoreMedia
import CoreImage
import CoreVideo
import CoreGraphics
import CoreText

/// Text overlay rendered into a Core Image buffer.
public struct TextOverlay: OverlayProtocol {
    /// Stable identifier for the overlay.
    public var id: UUID

    /// Start time for the overlay in the timeline.
    public var startTime: CMTime

    /// Duration the overlay remains visible.
    public var duration: CMTime

    /// Time range for the overlay in the timeline.
    public var timeRange: CMTimeRange {
        CMTimeRange(start: startTime, duration: duration)
    }

    /// Top-left position for the text baseline in the render buffer.
    public var position: CGPoint

    /// Text content to render.
    public var text: String

    /// PostScript font name used for rendering.
    public var fontName: String

    /// Font size in points. Values <= 0 use a size based on the render height.
    public var fontSize: CGFloat

    /// Text fill color.
    public var color: CGColor

    /// Creates a text overlay with configurable content and style.
    public init(
        id: UUID = UUID(),
        startTime: CMTime = .zero,
        duration: CMTime = .zero,
        position: CGPoint = .zero,
        text: String = "",
        fontName: String = "Helvetica",
        fontSize: CGFloat = 0,
        color: CGColor = CGColor(gray: 1.0, alpha: 1.0)
    ) {
        self.id = id
        self.startTime = startTime
        self.duration = duration
        self.position = position
        self.text = text
        self.fontName = fontName
        self.fontSize = fontSize
        self.color = color
    }

    /// Renders the text overlay into a `CIImage` at the given time and size.
    public func render(at time: CMTime, size: CGSize) -> CIImage? {

        let width = max(Int(size.width.rounded(.up)), 1)
        let height = max(Int(size.height.rounded(.up)), 1)

        let attributes: [CFString: Any] = [
            kCVPixelBufferCGImageCompatibilityKey: true,
            kCVPixelBufferCGBitmapContextCompatibilityKey: true
        ]

        var pixelBuffer: CVPixelBuffer?
        let status = CVPixelBufferCreate(
            kCFAllocatorDefault,
            width,
            height,
            kCVPixelFormatType_32BGRA,
            attributes as CFDictionary,
            &pixelBuffer
        )
        guard status == kCVReturnSuccess, let buffer = pixelBuffer else {
            return nil
        }

        CVPixelBufferLockBaseAddress(buffer, [])
        defer {
            CVPixelBufferUnlockBaseAddress(buffer, [])
        }

        guard let baseAddress = CVPixelBufferGetBaseAddress(buffer) else {
            return nil
        }

        let bytesPerRow = CVPixelBufferGetBytesPerRow(buffer)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo.byteOrder32Little.rawValue | CGImageAlphaInfo.premultipliedFirst.rawValue
        guard let context = CGContext(
            data: baseAddress,
            width: width,
            height: height,
            bitsPerComponent: 8,
            bytesPerRow: bytesPerRow,
            space: colorSpace,
            bitmapInfo: bitmapInfo
        ) else {
            return nil
        }

        context.clear(CGRect(x: 0, y: 0, width: width, height: height))
        context.setFillColor(color)

        let resolvedFontSize = fontSize > 0 ? fontSize : min(CGFloat(height) * 0.6, 48)
        let font = CTFontCreateWithName(fontName as CFString, resolvedFontSize, nil)
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: color
        ]
        let attributedString = NSAttributedString(string: text, attributes: textAttributes)
        let line = CTLineCreateWithAttributedString(attributedString)
        let lineBounds = CTLineGetBoundsWithOptions(line, .useGlyphPathBounds)

        context.textMatrix = .identity
        context.translateBy(x: 0, y: CGFloat(height))
        context.scaleBy(x: 1, y: -1)

        let clampedX = max(0, min(position.x, CGFloat(width) - lineBounds.width))
        let clampedY = max(0, min(position.y, CGFloat(height) - lineBounds.height))
        context.textPosition = CGPoint(x: clampedX, y: clampedY + lineBounds.height)
        CTLineDraw(line, context)

        return CIImage(cvPixelBuffer: buffer)
    }


}
