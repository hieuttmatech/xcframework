//
//  Bird.swift
//  Animals
//
//  Created by Hieutt on 20/04/2023.
//

import Foundation

public struct Bird: Animals,Flyable {
    
    public init() {}
    
    var canFly: Bool {
        return true
    }
    
    var vilocity: Float {
        return 100
    }
    
    public func fly() {
        print("I am flying")
    }
    
}
