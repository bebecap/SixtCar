//
//  Vehicle.swift
//  SixtCar
//
//  Created by Volodymyr Grytsenko on 30.10.19.
//  Copyright © 2019 Volodymyr Grytsenko. All rights reserved.
//

import Foundation

struct Vehicle: Codable {
    
    enum FuelType: String, Codable {
        case diesel = "D"
        case petrol = "P"
        case electric = "E"
    }
    
    enum TransmissionType: String, Codable {
        case manual = "M"
        case automatic = "A"
    }
    
    enum Cleanliness: String, Codable {
        case regular = "REGULAR"
        case clean = "CLEAN"
        case veryClean = "VERY_CLEAN"
    }
    
    var id: String
    var modelIdentifier: String
    var modelName: String
    var name: String
    var make: String
    var color: String
    var series: String
    var fuelType: FuelType
    var transmission: TransmissionType
    var licensePlate: String
    var latitude: Double
    var longitude: Double
    var carImageUrl: URL
}
