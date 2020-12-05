import Foundation

/// Occurs when resolving an unregistered dependency
public struct UnregisteredDependencyError: Error, Equatable {
  public var type: String
}

extension UnregisteredDependencyError: LocalizedError {
  public var errorDescription: String? {
    "Resolving unregistered dependency <\(type)>"
  }
}
