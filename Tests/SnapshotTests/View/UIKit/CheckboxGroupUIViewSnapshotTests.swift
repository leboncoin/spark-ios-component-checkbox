//
//  CheckboxGroupUIViewSnapshotTests.swift
//  SparkCheckboxSnapshotTests
//
//  Created by alican.aycil on 16.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit

@testable import SparkCheckbox
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme

final class CheckboxGroupUIViewSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = CheckboxGroupScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for (index, configuration) in configurations.enumerated() {

                let view = CheckboxGroupUIView(
                    checkedImage: configuration.image,
                    items: configuration.items,
                    layout: configuration.axis,
                    alignment: configuration.alignment,
                    theme: self.theme,
                    intent: configuration.intent,
                    accessibilityIdentifierPrefix: "\(index)"
                )
                view.translatesAutoresizingMaskIntoConstraints = false

                let containerView = UIView()
                containerView.backgroundColor = UIColor.systemBackground
                containerView.translatesAutoresizingMaskIntoConstraints = false
                containerView.addSubview(view)

                NSLayoutConstraint.stickEdges(from: view, to: containerView)

                if configuration.axis == .vertical {
                    containerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
                } else {
                    containerView.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.size.width).isActive = true
                }

                self.assertSnapshot(
                    matching: containerView,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName()
                )
            }
        }
    }
}
