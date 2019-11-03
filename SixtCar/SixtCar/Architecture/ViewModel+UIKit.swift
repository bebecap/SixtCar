
import UIKit

extension ViewModelDriven where Self: UIViewController {
    init(viewModel: ViewModelType) {
        self.init()
        self.viewModel = viewModel
    }
}
