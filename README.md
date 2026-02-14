# ApertureCore

ApertureCore is a Swift Package that provides core models, enums, protocols, and utilities for the Aperture project.

## Structure

- `Sources/ApertureCore`: Core library code (models, enums, protocols, extensions, errors)
- `Tests/ApertureCoreTests`: Unit tests

## Requirements

- Swift 5.9+ (via Swift Package Manager)

## Supported Platforms

- macOS 26+
- iOS 26+

## Installation

Swift Package Manager (Package.swift):

Remote package:

```swift
dependencies: [
    .package(url: "https://github.com/your-org/ApertureCore.git", from: "1.0.0")
],
```

Local package:

```swift
dependencies: [
    .package(path: "../ApertureCore")
],
```

Xcode:

- File > Add Packages...
- Add the remote package URL or select the local ApertureCore folder

## Usage

Import ApertureCore in your target:

```swift
import ApertureCore
```

Minimal example:

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

## Development

Open the project in Xcode and build/test using the ApertureCore scheme.
