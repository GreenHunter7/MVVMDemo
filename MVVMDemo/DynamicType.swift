//
//  DynamicType.swift
//  MVVMDemo
//
//  Created by MOMO on 6/5/18.
//  Copyright © 2018 MorniKSA. All rights reserved.
//

import Foundation

class DynamicType<T>{
    typealias Listener = (T) -> Void
    var listener :Listener = { _ in }
    
    var value :T? {
        didSet {
            listener(value!)
        }
    }
    
    init(_ v :T) {
        value = v
    }
    
    func bind(listener: Listener?) {
        self.listener = listener!
        listener?(value!)
    }

}
