
import RxSwift
import MapKit

class VehicleViewModel: NSObject, ViewModel {
        
    let id: BehaviorSubject<String>
    let modelIdentifier: BehaviorSubject<String>
    let modelName: BehaviorSubject<String>
    let name: BehaviorSubject<String>
    let make: BehaviorSubject<Vehicle.Make>
    let group: BehaviorSubject<Vehicle.Make>
    let color: BehaviorSubject<String>
    let series: BehaviorSubject<String>
    let fuelType: BehaviorSubject<Vehicle.FuelType>
    let fuelLevel: BehaviorSubject<Double>
    let transmission: BehaviorSubject<Vehicle.TransmissionType>
    let licensePlate: BehaviorSubject<String>
    let latitude: BehaviorSubject<Double>
    let longitude: BehaviorSubject<Double>
    let carImageUrl: BehaviorSubject<URL>
    
    init(from vehicle: Vehicle) {
        id = .init(value: vehicle.id)
        modelIdentifier = .init(value: vehicle.modelIdentifier)
        modelName = .init(value: vehicle.modelName)
        name = .init(value: vehicle.name)
        make = .init(value: vehicle.make)
        group = .init(value: vehicle.group)
        color = .init(value: vehicle.color)
        series = .init(value: vehicle.series)
        fuelType = .init(value: vehicle.fuelType)
        fuelLevel = .init(value: vehicle.fuelLevel)
        transmission = .init(value: vehicle.transmission)
        licensePlate = .init(value: vehicle.licensePlate)
        latitude = .init(value: vehicle.latitude)
        longitude = .init(value: vehicle.longitude)
        carImageUrl = .init(value: vehicle.carImageUrl)
    }
}
