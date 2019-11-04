
import Foundation
import MapKit

extension VehicleViewModel: MKAnnotation {
    var title: String? {
        guard let name = try? name.value() else { return .defaultVehicleTitle }
        return name
    }
    
    var coordinate: CLLocationCoordinate2D {
        guard let latitude = try? latitude.value(), let longitude = try? longitude.value() else { return .default }
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

private extension String {
    static var defaultVehicleTitle: String {
        return "Unknown title"
    }
}
