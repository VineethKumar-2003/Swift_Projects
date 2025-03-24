//
//  Recipe_Generator_using_Gemini_2_0_FlashUITestsLaunchTests.swift
//  Recipe Generator using Gemini 2.0 FlashUITests
//
//  Created by Vineeth Kumar on 22/03/25.
//

import XCTest

final class Recipe_Generator_using_Gemini_2_0_FlashUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
