//
//  ViewController.swift
//  RMCommandPoolKit
//
//  Created by ricocheng on 09/12/2023.
//  Copyright (c) 2023 ricocheng. All rights reserved.
//

import UIKit
import RMCommandPoolKit

extension String {
    public static var TestClickCommand = "TestClickCommand"
}

class ViewController: RMCommandPoolViewController {
    
    override func viewDidLoad() {
        
        bindCommandPool { commandPool in
            print("\(commandPool.key):\(commandPool.params)")
        }
        
        topSafeView.backgroundColor = .red
        leftSafeView.backgroundColor = .orange
        mainView.backgroundColor = .yellow
        rightSafeView.backgroundColor = .green
        bottomSafeView.backgroundColor = .blue
        
        let testView = TestView()
        testView.translatesAutoresizingMaskIntoConstraints = false
        testView.backgroundColor = .purple
        mainView.addCommandView(testView)
        
        let widthConstraint = NSLayoutConstraint(item: testView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200)
        let heightConstraint = NSLayoutConstraint(item: testView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200)
        let centerXConstraint = NSLayoutConstraint(item: testView, attribute: .centerX, relatedBy: .equal, toItem: testView.superview, attribute: .centerX, multiplier: 1.0, constant: 0)
        let centerYConstraint = NSLayoutConstraint(item: testView, attribute: .centerY, relatedBy: .equal, toItem: testView.superview, attribute: .centerY, multiplier: 1.0, constant: 0)
        
        testView.addConstraints([widthConstraint, heightConstraint])
        testView.superview!.addConstraints([centerXConstraint, centerYConstraint])
    }
}

class TestView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.command?(RMCommandPool(key: .TestClickCommand, params: "params can be of any type"))
    }
}
