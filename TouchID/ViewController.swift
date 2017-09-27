//
//  ViewController.swift
//  TouchID
//
//  Created by Giovannini Barbosa on 04/05/17.
//  Copyright © 2017 Giovannini Barbosa. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let authenticationContext = LAContext()
        
        var error: NSError?
        
        if authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        
        authenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "We need know how you are..") { (success, error) in
            
            if success {
                self.resultLabel.text = ("User has authenticated")
            } else {
                
                if let error = error {
                    print (error)
                    self.resultLabel.text = ("Error")
                } else {
                    self.resultLabel.text = ("Did not authenticate")
                }
            }
        }
                } else {
            
            self.resultLabel.text = ("Device does not have TouchID")
        }
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

