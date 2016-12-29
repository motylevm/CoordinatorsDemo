import UIKit

final class Coordinator2: BaseCoordinator {
    
    private var vc: UIViewController?
    
    override init(router: BaseRouter?) {
        super.init(router: router)
        
        router?.onPop = { [weak self] viewControllers -> Bool in
            
            guard let strongSelf = self else { return true }
            guard let vc = strongSelf.vc else { return true }
            
            if viewControllers.contains(vc) {
                strongSelf.onFinish?(strongSelf)
            }
            
            return true
        }
    }
    
    override func start() {
        showVC3()
    }
    
    private func showVC3() {
        
        let vc = ViewController3.controller(fromStoryboardNamed: "Main")
        self.vc = vc
        router?.pushAsync(vc) {
            NSLog("VC3 was pushed!")
        }
    }
    
    deinit {
        NSLog("Coordinator2 deinit")
    }
}
