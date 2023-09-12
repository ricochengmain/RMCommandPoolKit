//
//  RMCommand.swift
//  RMCommandPoolKit
//
//  Created by NeferUser on 2023/9/5.
//

import UIKit

protocol RMCommandPoolProtocol {
    var command: ((RMCommandPool) -> Void)? { get set }
}

public class RMCommandPool: NSObject {
    public var key: String = ""
    public var params: Any = ""
    
    public init(key: String, params: Any = "") {
        self.key = key
        self.params = params
        super.init()
    }
}
