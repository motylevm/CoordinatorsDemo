import UIKit

extension UIViewController {
    
    private class func instantiateControllerInStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
        
        guard let VC = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            assertionFailure("Failed to instantiate view controller")
            return T()
        }
        return VC
    }
    
    class func controller(from storyboard: UIStoryboard, identifier: String) -> Self {
        return instantiateControllerInStoryboard(storyboard, identifier: identifier)
    }
    
    class func controller(from storyboard: UIStoryboard) -> Self {
        return controller(from: storyboard, identifier: String(describing: self))
    }
    
    class func controller(fromStoryboardNamed name: String) -> Self {
        return controller(from: UIStoryboard(name: name, bundle: nil), identifier: String(describing: self))
    }
    
    class func controller(fromStoryboardNamed name: String, identifier: String) -> Self {
        return controller(from: UIStoryboard(name: name, bundle: nil), identifier: identifier)
    }

    class func controller() -> Self {
        return controller(from: UIStoryboard(name: String(describing: self), bundle: nil))
    }
}
