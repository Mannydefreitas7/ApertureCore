# Timeline Concepts

ApertureCore models a timeline as a collection of tracks containing ordered clips.

## Tracks

A ``Track`` holds an ordered list of clips. The timeline position of each clip is determined by its order in the track and the duration of earlier clips.

## Clips

A ``Clip`` represents a unit of media or content (video, audio, image, text, or compound). Each clip has a ``TimeRange`` that describes how much of the source media is used.

## Time Ranges

A ``TimeRange`` stores a start offset and duration in seconds. The start is the offset into the source asset, while the duration controls how long the clip plays in the timeline.

## Overlays

``TextOverlay`` instances can be rendered at specific times and positions, allowing captions and titles to be composed on top of the timeline output.
