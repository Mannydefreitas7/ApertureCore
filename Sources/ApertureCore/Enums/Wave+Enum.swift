//
//  Wave+Enum.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-14.
//
import Foundation

public enum Wave: String, CaseIterable {
    case waveform = "Waveform"
    case spectrum = "Spectrum"
    case spectrogram = "Spectrogram"
    case bars = "Bars"
    case circular = "Circular"
    case particles = "Particles"
}
