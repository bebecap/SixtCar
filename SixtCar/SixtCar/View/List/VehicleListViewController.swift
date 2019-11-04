
import UIKit
import RxSwift
import RxCocoa

class VehicleListViewController: UIViewController, StoryboardInitialViewController, ViewModelDriven {
    
    typealias ViewModelType = VehiclesViewModel
    var viewModel: ViewModelType!
    
    private let disposeBag = DisposeBag()
    
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.vehicles.bind(to: tableView.rx.items(cellIdentifier: "vehicleCell", cellType: VehicleTableViewCell.self)) { _, model, cell in
            cell.bindViews(viewModel: model)
        }.disposed(by: disposeBag)
    }    
}
