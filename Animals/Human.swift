//
//  Human.swift
//  Animals
//
//  Created by Hieutt on 20/04/2023.
//

import Foundation

public struct Human: Animals, Walkalble {
    
    public init() { }
    
    var canFly: Bool {
        return false
    }
    
    var vilocity: Float {
        return 10
    }
    
    public func walk() {
        print("I am walking")
    }
    
}
