# Usage

Import ApertureCore and build on the core models:

```swift
import ApertureCore
import CoreMedia
import CoreGraphics

let overlay = TextOverlay(
    startTime: .zero,
    duration: CMTime(seconds: 2, preferredTimescale: 600),
    position: CGPoint(x: 32, y: 64),
    text: "Hello Aperture",
    fontName: "Helvetica",
    fontSize: 24
)

let range = TimeRange(start: 0, duration: 3.5)
let filter = VideoFilter(name: "CISepiaTone", parameters: ["inputIntensity": 0.8])
```
