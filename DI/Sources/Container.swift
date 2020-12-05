/// Container that stores dependencies
public final class Container {
  /// Singleton instance of the container
  public static let shared = Container()

  public init() {}

  /// Register new dependency
  /// - Parameter dependency: dependency
  public func register<T>(_ dependency: T) {
    dependencies[key(for: T.self)] = dependency
  }

  /// Resolve dependency of given type T
  /// - Throws: UnregisteredDependencyError when dependency was not registered
  /// - Returns: Dependency
  public func resolve<T>() throws -> T {
    let key = self.key(for: T.self)
    guard let dependency = dependencies[key] as? T else {
      throw UnregisteredDependencyError(type: key)
    }
    return dependency
  }

  var dependencies = [String: Any]()

  func key<T>(for dependencyType: T.Type) -> String {
    String(describing: dependencyType)
  }
}
