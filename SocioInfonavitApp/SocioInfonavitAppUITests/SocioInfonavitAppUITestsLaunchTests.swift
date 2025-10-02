import XCTest

// MARK: - SocioInfonavitAppUITestsLaunchTests

final class SocioInfonavitAppUITestsLaunchTests: XCTestCase {
  // MARK: - Configuration

  override class var runsForEachTargetApplicationUIConfiguration: Bool {
    true
  }

  // MARK: - Lifecycle

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
