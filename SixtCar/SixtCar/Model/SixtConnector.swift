
import Alamofire

private let baseURL = URL(string: "https://cdn.sixt.io/")!

class SixtConnector {
    
    enum Endpoint: String {
        case vehicles = "codingtask/cars"
    }
    
    typealias VehiclesCompletionHandler = (Result<[Vehicle], AFError>) -> Void
    
    func loadVehicles(completion: VehiclesCompletionHandler? = nil) {
        AF.request(baseURL.appendingPathComponent(Endpoint.vehicles.rawValue)).responseDecodable { (response: DataResponse<[Vehicle], AFError>) in
            switch response.result {
            case .success(let vehicles):
                completion?(.success(vehicles))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
}
