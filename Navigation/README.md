# Navigation

Library for implementing navigation in the app. All components have documentation comments.

## How to

1. Define navigation action that conforms to `Action` protocol.
  - Navigation action can be a value-type with properties that describes the action.
  - Check out `Sources/Actions` directory for example actions.
2. Implement a navigator that can perform the action.
  - Conform to `TypedNavigator` protocol to implement a type-safe navigator that can handle actions of a given type.
  - Optionally implement `canPerform(_ action: ActionType) -> Bool` function if you want to restrict which actions can be performed by the navigator.
  - Implement `perform(_ action: ActionType,  completion: @escaping () -> Void)` function with a code that performs the action.
  - Remember to call `completion` closure after performing the action in `perform` function.
3. Use the navigator to perform the action.
  - For example, inject the navigator into the view controller that triggers the navigation and call `perform(YourAction())` instead of performing navigation directly.

## CombinedNavigator

Use it to combine multiple navigators into a single one:

```swift
let navigator: Navigator = CombinedNavigator(
  MyNavigatorA(),
  MyNavigatorB(),
  MyNavigatorC()
)
```

The view controllers to which you inject the navigator doesn't have to know the concrete type of the navigator:

```swift
final class MyViewController: UIViewController {
  let navigator: Navigator // = CombinedNavigator(...)

  func navigate() {
    navigator.perform(MyAction())
  }
}
```

## Included actions

The library contains generic navigation actions and navigators that perform them. Check out `Sources/Actions` directory. All actions and navigators contain documentation comments that explain how they work.
