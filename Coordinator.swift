protocol Coordinator: class {
    
    var onFinish: ((Coordinator) -> Void)? { get set }
    func start()
}
