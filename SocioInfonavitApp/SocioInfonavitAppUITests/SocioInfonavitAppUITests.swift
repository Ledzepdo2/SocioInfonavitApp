import XCTest

// MARK: - SocioInfonavitAppUITests

final class SocioInfonavitAppUITests: XCTestCase {
  // MARK: - Lifecycle

  override func setUpWithError() throws {
    continueAfterFailure = false
  }

  override func tearDownWithError() throws {
  }

  // MARK: - Tests

  @MainActor
  func testExample() throws {
    let app = XCUIApplication()
    app.launch()
  }

  @MainActor
  func testLaunchPerformance() throws {
    measure(metrics: [XCTApplicationLaunchMetric()]) {
      XCUIApplication().launch()
    }
  }
}
