import UIKit

final class TransitionCoordinatorDouble: NSObject, UIViewControllerTransitionCoordinator {
  var didAnimate: Bool = false
  var animationCompletion: ((UIViewControllerTransitionCoordinatorContext) -> Void)?

  // MARK: - UIViewControllerTransitionCoordinator

  func animate(
    alongsideTransition animation: ((UIViewControllerTransitionCoordinatorContext) -> Void)?,
    completion: ((UIViewControllerTransitionCoordinatorContext) -> Void)? = nil) -> Bool
  {
    didAnimate = true
    animationCompletion = completion
    return false
  }

  var isAnimated: Bool { fatalError() }
  var presentationStyle: UIModalPresentationStyle { fatalError() }
  var initiallyInteractive: Bool { fatalError() }
  var isInterruptible: Bool { fatalError() }
  var isInteractive: Bool { fatalError() }
  var isCancelled: Bool { fatalError() }
  var transitionDuration: TimeInterval { fatalError() }
  var percentComplete: CGFloat { fatalError() }
  var completionVelocity: CGFloat { fatalError() }
  var completionCurve: UIView.AnimationCurve { fatalError() }
  var containerView: UIView { fatalError() }
  var targetTransform: CGAffineTransform { fatalError() }

  func viewController(forKey key: UITransitionContextViewControllerKey) -> UIViewController? {
    fatalError()
  }

  func view(forKey key: UITransitionContextViewKey) -> UIView? {
    fatalError()
  }

  func animateAlongsideTransition(
    in view: UIView?,
    animation: ((UIViewControllerTransitionCoordinatorContext) -> Void)?,
    completion: ((UIViewControllerTransitionCoordinatorContext) -> Void)? = nil
  ) -> Bool {
    fatalError()
  }

  func notifyWhenInteractionEnds(_ handler: @escaping (UIViewControllerTransitionCoordinatorContext) -> Void) {
    fatalError()
  }

  func notifyWhenInteractionChanges(_ handler: @escaping (UIViewControllerTransitionCoordinatorContext) -> Void) {
    fatalError()
  }
}
