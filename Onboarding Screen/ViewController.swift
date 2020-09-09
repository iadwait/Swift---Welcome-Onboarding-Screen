//
//  ViewController.swift
//  Onboarding Screen
//
//  Created by Adwait Barkale on 09/09/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if core.shared.isNewUser(){
            //Onboarding Screen
            let vc = storyboard?.instantiateViewController(identifier: "WelcomeViewController") as! WelcomeViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc,animated: true)
        }
    }
}

class core{
    
    static let shared = core()
    
    func isNewUser() -> Bool
    {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setIsNotNewUser()
    {
         UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}

