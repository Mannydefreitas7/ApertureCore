# Getting Started

Use the core model types to assemble timeline data and rendering inputs.

```swift
import ApertureCore
import CoreMedia
import CoreGraphics

let range = TimeRange(start: 0, duration: 3.5)

let overlay = TextOverlay(
    startTime: .zero,
    duration: CMTime(seconds: 2, preferredTimescale: 600),
    position: CGPoint(x: 32, y: 64),
    text: "Hello Aperture",
    fontName: "Helvetica",
    fontSize: 24
)

let filter = VideoFilter(
    name: "CISepiaTone",
    parameters: ["inputIntensity": 0.8]
)

_ = range
_ = overlay
_ = filter
```
