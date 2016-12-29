import Foundation

//let storyboard = UIStoryboard

final class Coordinator1: BaseCoordinator {
    
    override func start() {
        showVC1()
    }
    
    private func showVC1() {
        
        let vc = ViewController1.controller(fromStoryboardNamed: "Main")
        
        vc.onNext = { [weak self] in
            self?.showVC2()
        }
        
        router?.push(vc) {
            NSLog("VC1 was pushed!")
        }
    }
    
    private func showVC2() {
        
        let vc = ViewController2.controller(fromStoryboardNamed: "Main")
        
        vc.onNext = { [weak self] in
            self?.runCoordinator2()
        }
        
        router?.pushAsync(vc) {
            NSLog("VC2 was pushed!")
        }
    }
    
    private func runCoordinator2() {
        
        let coordinator2 = Coordinator2(router: router)
        addDependency(coordinator2, forKey: "coordinator2")
        
        coordinator2.onFinish = { [weak self] _ in
            self?.removeDependency(forKey: "coordinator2")
        }
        
        coordinator2.start()
    }
}
