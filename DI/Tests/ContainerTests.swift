import XCTest
@testable import DI

final class ContainerTests: XCTestCase {
  func testRegisterAndResolveDependency() {
    let container = Container()
    let dependency = TestDependency()
    container.register(dependency as TestDependencyProtocol)
    let resolvedDependency: TestDependencyProtocol = try! container.resolve()

    XCTAssert(resolvedDependency === dependency)
  }

  func testResolveUnregisteredDependency() {
    let container = Container()
    do {
      let _: TestDependencyProtocol = try container.resolve()
      XCTFail("expected to throw an error")
    } catch {
      XCTAssertEqual(
        error as? UnregisteredDependencyError,
        UnregisteredDependencyError(
          type: String(describing: TestDependencyProtocol.self)
        )
      )
    }
  }
}

private protocol TestDependencyProtocol: AnyObject {}

private class TestDependency: TestDependencyProtocol {}
