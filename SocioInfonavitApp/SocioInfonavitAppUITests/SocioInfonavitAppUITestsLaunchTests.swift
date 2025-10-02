//
//  SocioInfonavitAppUITestsLaunchTests.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 30/09/25.
//

import XCTest

final class SocioInfonavitAppUITestsLaunchTests: XCTestCase {
    // MARK: - XCTestCase

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    // MARK: - Tests

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
