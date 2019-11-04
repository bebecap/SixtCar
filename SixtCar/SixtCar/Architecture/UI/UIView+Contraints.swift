
import UIKit

extension UIView {
    
    public func addSubviewAndEdgeConstraints(_ subview: UIView, edges: UIRectEdge = .all) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        addEdgeConstraints(for: subview, edges: edges)
    }
    
    public func addEdgeConstraints(for subview: UIView, edges: UIRectEdge = .all) {
        
        if edges.contains(.top) {
            subview.topAnchor.constraint(equalTo: topAnchor).isActive = true
        }
        
        if edges.contains(.bottom) {
            bottomAnchor.constraint(equalTo: subview.bottomAnchor).isActive = true
        }
        
        if edges.contains(.left) {
            subview.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        }
        
        if edges.contains(.right) {
            rightAnchor.constraint(equalTo: subview.rightAnchor).isActive = true
        }
    }
}
