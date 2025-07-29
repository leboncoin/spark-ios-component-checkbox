//
//  CheckboxConfigurationSnapshotTests.swift
//  SparkComponentCheckboxSnapshotTests
//
//  Created by alican.aycil on 16.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
@testable import SparkComponentCheckbox
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct CheckboxConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: CheckboxScenarioSnapshotTests
    let intent: CheckboxIntent
    let selectionState: CheckboxSelectionState
    let state: CheckboxState
    let alignment: CheckboxAlignment
    let text: String
    let image: UIImage
    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    // MARK: - Getter

    func testName() -> String {
        return [
            "\(self.scenario.rawValue)",
            "\(self.intent)",
            "\(self.selectionState)",
            "\(self.state)",
            "\(self.alignment)"
        ].joined(separator: "-")
    }
}

enum CheckboxState: CaseIterable {
    case enabled
    case disabled
    case pressed
}
