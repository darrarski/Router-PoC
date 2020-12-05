# DI

Simple Dependency Injection library.

## How to

Use a container for storing your app's dependencies.

1. Define dependency:

  ```swift
  protocol MyDependencyProtocol {
    func doSomething()
  }

  class MyDependency: MyDependencyProtocol {
    func doSomething() {}
  }
  ```

2. Register the dependency in a container:

   ```swift
   let container = DI.Container.shared
   container.register(MyDependency() as MyDependencyProtocol)
   ```

3. Resolve the dependency from the container manually:

  ```swift
  let container = DI.Container.shared
  let dependency: MyDependencyProtocol = try container.resolve()
  ```
  
4. Resolve the dependency from the container using `@Depenedency` property wrapper:

  ```swift
  final class MyViewController: UIViewController {
    @Dependency var dependency: MyDependencyProtocol
    
    func doSomethingWithDependency() {
      self.dependency.doSomething()
    }
  }
  ```
