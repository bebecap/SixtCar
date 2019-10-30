//
//  SixtConnector.swift
//  SixtCar
//
//  Created by Volodymyr Grytsenko on 30.10.19.
//  Copyright © 2019 Volodymyr Grytsenko. All rights reserved.
//

import Alamofire

private let baseURL = URL(string: "https://cdn.sixt.io/")!

class SixtConnector {
    
    typealias VehicleCompletionHandler = (Result<[Vehicle], AFError>) -> Void
    
    func loadVehicles(completion: VehicleCompletionHandler? = nil) {
        AF.request(baseURL.appendingPathComponent("codingtask/cars")).responseDecodable { (response: DataResponse<[Vehicle], AFError>) in
            switch response.result {
            case .success(let vehicles):
                completion?(.success(vehicles))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
}
