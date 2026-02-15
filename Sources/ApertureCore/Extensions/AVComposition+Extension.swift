//
//  AVComposition+Extension.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-14.
//

#if canImport(AVFoundation)
import AVFoundation

    // MARK: - Swift 6 Concurrency Support
    // AVMutableComposition is used across concurrency boundaries but is not marked as Sendable
    // by Apple. We mark it as @unchecked Sendable because:
    // 1. AVMutableComposition is thread-safe for the operations we perform
    // 2. We control all access points and ensure proper isolation
extension AVMutableComposition: @unchecked @retroactive Sendable {}
#endif
