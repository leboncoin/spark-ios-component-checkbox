//
//  CheckboxColorsUseCaseTests.swift
//  SparkCheckbox
//
//  Created by janniklas.freundt.ext on 17.04.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkCheckbox
@_spi(SI_SPI) import SparkThemingTesting

final class CheckboxColorsUseCaseTests: XCTestCase {

    var sut: CheckboxColorsUseCase!
    var theme: ThemeGeneratedMock!

    override func setUp() {
        super.setUp()

        self.sut = .init()
        self.theme = .mocked()
    }

    // MARK: - Tests

    func test_execute_for_all_intent_cases() {
        let intents = CheckboxIntent.allCases

        intents.forEach {

            let checkboxColors = sut.execute(from: theme.colors, intent: $0)

            let expectedColors: CheckboxColors

            switch $0 {
            case .basic:
                expectedColors = CheckboxColors(
                    textColor: theme.colors.base.onSurface,
                    borderColor: theme.colors.base.outline,
                    tintColor: theme.colors.basic.basic,
                    iconColor: theme.colors.basic.onBasic,
                    pressedBorderColor: theme.colors.basic.basicContainer
                )
            case .accent:
                expectedColors = CheckboxColors(
                    textColor: theme.colors.base.onSurface,
                    borderColor: theme.colors.base.outline,
                    tintColor: theme.colors.accent.accent,
                    iconColor: theme.colors.accent.onAccent,
                    pressedBorderColor: theme.colors.accent.accentContainer
                )
            case .error:
                expectedColors = CheckboxColors(
                    textColor: theme.colors.base.onSurface,
                    borderColor: theme.colors.base.outline,
                    tintColor: theme.colors.feedback.error,
                    iconColor: theme.colors.feedback.onError,
                    pressedBorderColor: theme.colors.feedback.errorContainer
                )
            case .success:
                expectedColors = CheckboxColors(
                    textColor: theme.colors.base.onSurface,
                    borderColor: theme.colors.base.outline,
                    tintColor: theme.colors.feedback.success,
                    iconColor: theme.colors.feedback.onSuccess,
                    pressedBorderColor: theme.colors.feedback.successContainer
                )
            case .alert:
                expectedColors = CheckboxColors(
                    textColor: theme.colors.base.onSurface,
                    borderColor: theme.colors.base.outline,
                    tintColor: theme.colors.feedback.alert,
                    iconColor: theme.colors.feedback.onAlert,
                    pressedBorderColor: theme.colors.feedback.alertContainer
                )
            case .info:
                expectedColors = CheckboxColors(
                    textColor: theme.colors.base.onSurface,
                    borderColor: theme.colors.base.outline,
                    tintColor: theme.colors.feedback.info,
                    iconColor: theme.colors.feedback.onInfo,
                    pressedBorderColor: theme.colors.feedback.infoContainer
                )
            case .neutral:
                expectedColors = CheckboxColors(
                    textColor: theme.colors.base.onSurface,
                    borderColor: theme.colors.base.outline,
                    tintColor: theme.colors.feedback.neutral,
                    iconColor: theme.colors.feedback.onNeutral,
                    pressedBorderColor: theme.colors.feedback.neutralContainer
                )
            case .support:
                expectedColors = CheckboxColors(
                    textColor: theme.colors.base.onSurface,
                    borderColor: theme.colors.base.outline,
                    tintColor: theme.colors.support.support,
                    iconColor: theme.colors.support.onSupport,
                    pressedBorderColor: theme.colors.support.supportContainer
                )
            case .main:
                expectedColors = CheckboxColors(
                    textColor: theme.colors.base.onSurface,
                    borderColor: theme.colors.base.outline,
                    tintColor: theme.colors.main.main,
                    iconColor: theme.colors.main.onMain,
                    pressedBorderColor: theme.colors.main.mainContainer
                )
            }

            XCTAssertEqual(checkboxColors.textColor.uiColor, expectedColors.textColor.uiColor)
            XCTAssertEqual(checkboxColors.borderColor.uiColor, expectedColors.borderColor.uiColor)
            XCTAssertEqual(checkboxColors.tintColor.uiColor, expectedColors.tintColor.uiColor)
            XCTAssertEqual(checkboxColors.iconColor.uiColor, expectedColors.iconColor.uiColor)
            XCTAssertEqual(checkboxColors.pressedBorderColor.uiColor, expectedColors.pressedBorderColor.uiColor)
        }
    }
}
