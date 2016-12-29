import UIKit

extension UIView {
    
    func enumerateSubviews(block: (UIView) -> Void) {
        
        subviews.forEach { view in
            
            block(view)
            view.enumerateSubviews(block: block)
        }
    }
}
