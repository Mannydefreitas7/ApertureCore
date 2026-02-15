//
//  EditCommand+Extension.swift
//  ApertureCore
//
//  Created by Emmanuel on 2026-02-14.
//

import Foundation
import Combine
import AVFoundation

    /// Edit operation command protocol
protocol EditCommand {
        /// Execute operation
    func execute()

        /// Undo operation
    func undo()

        /// Operation description
    var description: String { get }
}
