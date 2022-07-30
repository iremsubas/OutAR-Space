//
//  ViewController.swift
//  Gyro
//
//  Created by Defne  Dedehayır on 25.04.2022.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var motionManager = CMMotionManager()
    var rotationRate = CMRotationRate()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        motionManager.gyroUpdateInterval = 0.2
        
        motionManager.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data
            {
                if myData.rotationRate.x > 3
                {
                    print ("YOUR TILTED YOUR DEVICE")
                if myData.rotationRate.y > 3
                {
                    print ("YOUR TILTED YOUR DEVICE")
                if myData.rotationRate.z > 3
                {
                    print ("YOUR TILTED YOUR DEVICE")
                }
            }
        }
    }

            func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
    }
}
