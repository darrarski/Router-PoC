/// Property wrapper that resolves dependency of a given type from the container
/// - Dependency is resolved when wrapped value getter is accessed
/// - Triggers fatalError when resolving throws an error
@propertyWrapper
public struct Dependency<T> {
  /// - Parameters:
  ///   - container: Container from which dependency should be resolved (defaults to `.shared`)
  public init(container: Container = .shared, file: StaticString = #file, line: UInt = #line) {
    self.container = container
    self.file = file
    self.line = line
  }

  public var wrappedValue: T {
    do {
      return try container.resolve()
    } catch {
      fatalError(error.localizedDescription, file: file, line: line)
    }
  }

  let container: Container
  let file: StaticString
  let line: UInt
}
