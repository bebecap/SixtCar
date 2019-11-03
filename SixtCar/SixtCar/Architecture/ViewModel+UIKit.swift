
import UIKit

extension ViewModelDriven where Self: UIViewController {
    init(viewModel: ViewModelType) {
        self.init()
        self.viewModel = viewModel
    }
}

extension StoryboardViewController where Self: ViewModelDriven {
    static func instantiateFromStoryboard(viewModel: Self.ViewModelType) -> Self {
        let controller = instantiateFromStoryboard()
        controller.viewModel = viewModel
        return controller
    }
}
