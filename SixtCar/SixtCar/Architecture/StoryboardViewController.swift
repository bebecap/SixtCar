
import UIKit

protocol StoryboardViewController: class {
    static var storyboardName: String {get}
    static var storyboardIdentifier: String {get}
    static var bundle: Bundle {get}

    static func instantiateFromStoryboard() -> Self
}

extension StoryboardViewController {
    static var storyboardName: String {
        return String(describing: self)
    }

    static var storyboardIdentifier: String {
        return String(describing: self)
    }

    static var bundle: Bundle {
        return Bundle(for: Self.self)
    }
}

protocol StoryboardInitialViewController: StoryboardViewController {}

extension StoryboardInitialViewController {
    static func instantiateFromStoryboard() -> Self {
        return UIStoryboard(name: self.storyboardName, bundle: bundle).instantiateInitialViewController() as! Self
    }
}

protocol StoryboardEmbeddedViewController: StoryboardViewController {
    associatedtype StoryboardEmbeddingViewController: UIViewController
    var embeddingViewController: StoryboardEmbeddingViewController {get}
}

extension StoryboardEmbeddedViewController where Self: UIViewController, StoryboardEmbeddingViewController: UINavigationController {
    var embeddingViewController: StoryboardEmbeddingViewController {
        return self.navigationController as! StoryboardEmbeddingViewController
    }

    static func instantiateFromStoryboard() -> Self {
        let embeddingViewController = UIStoryboard(name: self.storyboardName, bundle: bundle).instantiateInitialViewController() as! UINavigationController
        return embeddingViewController.topViewController as! Self
    }
}
