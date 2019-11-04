
import UIKit

class RootViewController: UIViewController, StoryboardInitialViewController, ViewModelDriven {
       
    typealias ViewModelType = RootViewModel
    var viewModel: ViewModelType!

    enum Mode {
        case map
        case table
    }
    
    @IBOutlet private weak var representationContainerView: UIView!
    
    private var mapViewController: VehicleMapViewController!
    private var listViewController: VehicleListViewController!
    private var modeButton: UIBarButtonItem!
    
    private var mode: Mode = .map {
        didSet {
            guard mode != oldValue else { return }
            self.updateSelectedViewController(mode: self.mode)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vehiclesViewModel = viewModel.vehiclesViewModel
        
        mapViewController = VehicleMapViewController.instantiateFromStoryboard(viewModel: vehiclesViewModel)
        listViewController = VehicleListViewController.instantiateFromStoryboard(viewModel: vehiclesViewModel)
        
        modeButton = UIBarButtonItem(image: mode.image, style: .plain, target: self, action: #selector(toggleSelectedView))
        
        navigationItem.rightBarButtonItem = modeButton
        
        updateSelectedViewController(mode: .map)
    }
    
    private func updateSelectedViewController(mode: Mode) {
        let viewControllerToPresent: UIViewController = mode == .map ? mapViewController : listViewController
        let viewControllerToRemove: UIViewController = mode == .map ? listViewController : mapViewController
        
        viewControllerToRemove.view.removeFromSuperview()
        viewControllerToRemove.removeFromParent()
        
        UIView.transition(with: representationContainerView, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.representationContainerView.addSubviewAndEdgeConstraints(viewControllerToPresent.view)
            viewControllerToPresent.didMove(toParent: self)
            self.addChild(viewControllerToPresent)
            
            self.modeButton.image = mode.image
        })
    }
    
    @objc
    private func toggleSelectedView() {
        mode = mode == .table ? .map : .table
    }
}

private extension RootViewController.Mode {
    var image: UIImage {
        switch self {
        case .table:
            return UIImage(systemName: "map")!
        case .map:
            return UIImage(systemName: "table")!
        }
    }
}
