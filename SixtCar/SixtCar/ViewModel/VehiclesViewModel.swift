
import RxSwift
import Foundation

class VehiclesViewModel: ViewModel {
    
    // MARK: - Internal variables
    
    private let sixtConnector: SixtConnector
    
    // MARK: - Observables
    
    let vehicles = BehaviorSubject<[VehicleViewModel]>(value: [])
    let isLoading = BehaviorSubject<Bool>(value: false)
    let requestError = BehaviorSubject<RequestError?>(value: nil)
    
    init(sixtConnector: SixtConnector) {
        self.sixtConnector = sixtConnector
    }
    
    func loadVehicles() {
        isLoading.onNext(true)
        sixtConnector.loadVehicles { (result) in
            switch result {
            case .success(let vehicles):
                self.vehicles.onNext(vehicles.map{ VehicleViewModel(from: $0) })
            case .failure(let error):
                self.requestError.onNext(.serverError(error.errorDescription))
            }
            self.isLoading.onNext(false)
        }
    }
}
