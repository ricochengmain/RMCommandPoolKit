//
//  RMCommandView.swift
//  RMCommandPoolKit
//
//  Created by ricocheng on 2023/7/12.
//

import UIKit

extension UIView: RMCommandPoolProtocol {
    
    public func addCommandView(_ view: UIView) {
        self.addSubview(view)
        if view.command == nil {
            view.command = self.command
        }
    }
    
    public var command: ((RMCommandPool) -> Void)? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.command) as? ((RMCommandPool) -> Void)
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.command, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            for subview in self.subviews {
                if subview.command == nil {
                    subview.command = newValue
                }
            }
        }
    }
    
    private struct AssociatedKeys {
        static var command = "RMCommandPoolKit"
    }
}
