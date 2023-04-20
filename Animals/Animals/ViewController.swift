//
//  ViewController.swift
//  Animals
//
//  Created by Hieutt on 20/04/2023.
//

import UIKit
import AnimalsSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let bird = Bird()
        bird.fly()
        
        let human = Human()
        human.walk()
        
    }


}

