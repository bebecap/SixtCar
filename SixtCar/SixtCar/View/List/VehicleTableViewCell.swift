
import UIKit
import RxCocoa
import RxSwift
import Kingfisher

class VehicleTableViewCell: UITableViewCell {

    @IBOutlet private weak var vehicleNameLabel: UILabel!
    @IBOutlet private weak var vehicleGroupLabel: UILabel!
    @IBOutlet private weak var vehicleSeriesLabel: UILabel!
    @IBOutlet private weak var licensePlateLabel: UILabel!
    @IBOutlet private weak var vehicleImage: UIImageView!
    @IBOutlet private weak var rangeLabel: UILabel!
    @IBOutlet private weak var transmissionTypeLabel: UILabel!
    
    private let disposeBag = DisposeBag()

    func bindViews(viewModel: VehicleViewModel) {
        viewModel.name.bind(to: vehicleNameLabel.rx.text).disposed(by: disposeBag)
        viewModel.carImageUrl.subscribe(vehicleImageURLSubscriber(event:)).disposed(by: disposeBag)
        viewModel.group.map { $0.title }.bind(to: vehicleGroupLabel.rx.text).disposed(by: disposeBag)
        viewModel.series.bind(to: vehicleSeriesLabel.rx.text).disposed(by: disposeBag)
        viewModel.licensePlate.bind(to: licensePlateLabel.rx.text).disposed(by: disposeBag)
        viewModel.fuelLevel.map { "\(Int($0 * 100))%" }.bind(to: rangeLabel.rx.text).disposed(by: disposeBag)
        viewModel.transmission.map { $0.title }.bind(to: transmissionTypeLabel.rx.text).disposed(by: disposeBag)
    }
    
    private func vehicleImageURLSubscriber(event: RxSwift.Event<URL>) -> Void {
        switch event {
        case .next(let url):
            self.vehicleImage.kf.setImage(with: url, placeholder: UIImage.fallbackVehicleImage)
        default:
            break
        }
    }
}

private extension Vehicle.TransmissionType {
    var title: String {
        switch self {
        case .automatic:
            return "Automatic"
        case .manual:
            return "Manual"
        }
    }
}

private extension Vehicle.Make {
    var title: String {
        switch self {
        case .bmw:
            return "BMW"
        case .mini:
            return "MINI"
        }
    }
}

private extension UIImage {
    static var fallbackVehicleImage: UIImage {
        return UIImage(systemName: "car.fill")!
    }
}
