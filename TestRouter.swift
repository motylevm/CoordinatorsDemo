import UIKit

private let whiteTintColor = UIColor(white: 0.8, alpha: 1)
private let authAlongsideTransition = { (context: UIViewControllerTransitionCoordinatorContext) -> Void in
    
    let fromView = context.view(forKey: .from)
    let toView = context.view(forKey: .to)
    
    UIView.performWithoutAnimation {
        
        fromView?.alpha = 1
        toView?.alpha = 0
        
        context.containerView.enumerateSubviews { view in
            
            if "\(view)".contains("_UIParallaxDimmingView") {
                view.backgroundColor = .clear
            }
        }
    }
    
    fromView?.alpha = 0
    toView?.alpha = 1
}

final class TestRouter: BaseRouter {
    
    // MARK: - Alongsize Animation -
    override func alongsideTransitionForPushing(viewController: UIViewController) -> ((UIViewControllerTransitionCoordinatorContext) -> Void)? {
        //return nil
        return authAlongsideTransition
    }
    
    override func alongsideTransitionForPopping(viewControllers: [UIViewController]) -> ((UIViewControllerTransitionCoordinatorContext) -> Void)? {
        //return nil
        return authAlongsideTransition
    }
}
