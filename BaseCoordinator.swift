import UIKit

open class BaseCoordinator: Coordinator {
    
    // MARK: - Properties -
    private(set) weak var router: BaseRouter?
    var onFinish: ((Coordinator) -> Void)?
    
    private(set) var childCoordinators: [String: Coordinator] = [:]
    
    // MARK: - Init -
    init(router: BaseRouter?) {
        self.router = router
    }
    
    // MARK: - Flow -
    open func start() {
    }
    
    // MARK: - Dependency Managing -
    func addDependency(_ coordinator: Coordinator, forKey key: String) {
        childCoordinators[key] = coordinator
    }
    
    func removeDependency(forKey key: String) {
        childCoordinators.removeValue(forKey: key)
    }
}
