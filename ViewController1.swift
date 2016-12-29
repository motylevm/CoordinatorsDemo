import UIKit

class ViewController1: UIViewController {
    
    var onNext: (() -> Void)?

    @IBAction func onTapNext(_ sender: Any) {
        onNext?()
    }
}
