//
//  AudioForma+Enum.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-14.
//
import AVFoundation

public enum AudioFormat {
    case m4a
    case mp3
    case wav

    var fileType: AVFileType {
        switch self {
            case .m4a:
                return .m4a
            case .mp3:
                return .mp3
            case .wav:
                return .wav
        }
    }
}
