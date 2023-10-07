import UIKit

   class MainTabBarController: UITabBarController {
       override func viewDidLoad() {
           super.viewDidLoad()
           // Add logic for transitioning between ViewControllers
           self.delegate = self
       }
   }

   extension MainTabBarController: UITabBarControllerDelegate {
       func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
           return SlideTransition()
       }
   }

   class SlideTransition: NSObject, UIViewControllerAnimatedTransitioning {
       func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
           return 0.3
       }

       func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
           let containerView = transitionContext.containerView
           let toView = transitionContext.view(forKey: .to)!
           containerView.addSubview(toView)
           toView.transform = CGAffineTransform(translationX: containerView.frame.width, y: 0)
           UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
               toView.transform = CGAffineTransform.identity
           }) { (finished) in
               transitionContext.completeTransition(finished)
           }
       }
   }