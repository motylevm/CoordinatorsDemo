import UIKit

class ViewController2: UIViewController {

    var onNext: (() -> Void)?
    
    @IBAction func onTapNext(_ sender: Any) {
        onNext?()
    }
}
