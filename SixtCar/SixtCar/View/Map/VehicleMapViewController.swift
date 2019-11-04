
import UIKit
import Foundation
import RxSwift
import MapKit

class VehicleMapViewController: UIViewController, StoryboardInitialViewController, ViewModelDriven, MKMapViewDelegate, CLLocationManagerDelegate {
    
    typealias ViewModelType = VehiclesViewModel
    var viewModel: ViewModelType!
    
    private let disposeBag = DisposeBag()
    private let locationManager = CLLocationManager()
    
    // MARK: - Outlets
    
    @IBOutlet private weak var mapView: MKMapView!
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribe()
        setupMapView()
        viewModel.loadVehicles()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    
    // MARK: - Subcribers
    
    private func isLoadingSubscriber(event: RxSwift.Event<Bool>) -> Void {
        print(event)
    }
    
    private func requestErrorSubscriber(event: RxSwift.Event<RequestError?>) -> Void {
        switch event {
        case .next(let error):
            guard let error = error else { return }
            self.present(UIAlertController.basicAlert(title: "Error", message: error.message), animated: true, completion: nil)
        default:
            return
        }
    }
    
    private func vehiclesSubscriber(event: RxSwift.Event<[VehicleViewModel]>) -> Void {
        switch event {
        case .next(let vehicles):
            mapView.addAnnotations(vehicles)
        default:
            break
        }
    }
    
    private func subscribe() {
        viewModel.isLoading.subscribe(isLoadingSubscriber(event:)).disposed(by: disposeBag)
        viewModel.requestError.subscribe(requestErrorSubscriber(event:)).disposed(by: disposeBag)
        viewModel.vehicles.subscribe(vehiclesSubscriber(event:)).disposed(by: disposeBag)
    }
    
    // MARK: - Internal functionality
    
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.startUpdatingLocation()
        }
    }
    
    func setupMapView() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        mapView.showsUserLocation = true
    }

    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .notDetermined) {
            locationManager.requestWhenInUseAuthorization()
        } else {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation

        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

        mapView.setRegion(region, animated: true)
        
        locationManager.stopUpdatingLocation()
    }
}

private extension RequestError {
    var message: String {
        switch self {
        case .internetError(let error):
            let message = error ?? "No message"
            return "Internet error: \(message)"
        case .serverError(let error):
            let message = error ?? "No message"
            return "Server error: \(message)"
        case .unknownError:
            return "Unknown error"
        }
    }
}
