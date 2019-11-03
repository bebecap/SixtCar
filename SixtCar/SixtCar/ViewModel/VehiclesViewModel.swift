
import RxSwift
import Foundation

class VehiclesViewModel: ViewModel {
    
    // MARK: - Internal variables
    
    private let sixtConnector: SixtConnector
    
    // MARK: - Observables
    
    let vehicles = PublishSubject<[Vehicle]>()
    let isLoading = PublishSubject<Bool>()
    let requestError = PublishSubject<RequestError?>()
    
    init(sixtConnector: SixtConnector) {
        self.sixtConnector = sixtConnector
    }
    
    func loadVehicles() {
        isLoading.onNext(true)
        sixtConnector.loadVehicles { (result) in
            switch result {
            case .success(let vehicles):
                self.vehicles.onNext(vehicles)
            case .failure(let error):
                self.requestError.onNext(.serverError(error.errorDescription))
            }
            self.isLoading.onNext(false)
        }
    }
}
