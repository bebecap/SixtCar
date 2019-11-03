
class RootViewModel: ViewModel {
    
    let sixtConnector: SixtConnector
    
    init() {
        self.sixtConnector = SixtConnector()
    }
    
    var vehiclesViewModel: VehiclesViewModel {
        return VehiclesViewModel(sixtConnector: sixtConnector)
    }
    
}
