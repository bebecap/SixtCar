
protocol ViewModelDriven: class {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType! { get set }
}
