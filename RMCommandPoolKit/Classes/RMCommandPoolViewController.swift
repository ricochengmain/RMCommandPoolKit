//
//  ViewController.swift
//  RMCommandPoolKit
//
//  Created by ricocheng on 2023/7/12.
//

import UIKit

@available(iOS 11.0, *)
open class RMCommandPoolViewController: UIViewController {
    
    open func bindCommandPool(_ closure: @escaping (_ RMCommandPool: RMCommandPool) -> Void) {
        super.viewDidLoad()
        self.command = closure
        self.view.command = self.command
        view.backgroundColor = .clear
        view.addCommandView(topSafeView)
        view.addCommandView(leftSafeView)
        view.addCommandView(mainView)
        view.addCommandView(rightSafeView)
        view.addCommandView(bottomSafeView)
        
        setConstraints()
    }
    
    public var topSafeView = UIView()
    
    public var leftSafeView = UIView()
    
    public var mainView = UIView()
    
    public var rightSafeView = UIView()
    
    public var bottomSafeView = UIView()
    
    public var command: ((RMCommandPool) -> Void)?
    
    private func setConstraints() {
        [topSafeView, leftSafeView, mainView, rightSafeView, bottomSafeView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            // 设置content视图的约束
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            // 设置topSafeView的约束
            topSafeView.topAnchor.constraint(equalTo: view.topAnchor),
            topSafeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topSafeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topSafeView.bottomAnchor.constraint(equalTo: mainView.topAnchor),
            
            // 设置leftSafeView的约束
            leftSafeView.topAnchor.constraint(equalTo: topSafeView.bottomAnchor),
            leftSafeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            leftSafeView.trailingAnchor.constraint(equalTo: mainView.leadingAnchor),
            leftSafeView.bottomAnchor.constraint(equalTo: bottomSafeView.topAnchor),
            
            // 设置rightSafeView的约束
            rightSafeView.topAnchor.constraint(equalTo: topSafeView.bottomAnchor),
            rightSafeView.leadingAnchor.constraint(equalTo: mainView.trailingAnchor),
            rightSafeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rightSafeView.bottomAnchor.constraint(equalTo: bottomSafeView.topAnchor),
            
            // 设置bottomSafeView的约束
            bottomSafeView.topAnchor.constraint(equalTo: mainView.bottomAnchor),
            bottomSafeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomSafeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomSafeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
