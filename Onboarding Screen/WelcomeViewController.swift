//
//  WelcomeViewController.swift
//  Onboarding Screen
//
//  Created by Adwait Barkale on 09/09/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var holderView: UIView!
    
    let scrollView = UIScrollView()
    
    let titles = [
    "Welcome",
    "Location",
    "All Set"
    ]
    
    let images = [
    "welcome",
    "location",
    "allset"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
    }
    
    func configure()
    {
        //Add scroll view
        scrollView.frame = holderView.bounds
        holderView.addSubview(scrollView)
        
        for x in 0..<3 {
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * holderView.frame.size.width, y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
            scrollView.addSubview(pageView)
            
            //Add title Image and Button
            let label = UILabel(frame: CGRect(x: 10, y: 10, width: pageView.frame.size.width - 20, height: 120))
            let imageView = UIImageView(frame: CGRect(x: 10, y: 140, width: pageView.frame.size.width - 20, height: pageView.frame.size.height - 60 - 130 - 15))
            let button = UIButton(frame: CGRect(x: 10, y: pageView.frame.size.height - 60, width: pageView.frame.size.width - 20, height: 50))
            
            label.textAlignment = .center
            label.text = titles[x]
            label.font = .systemFont(ofSize: 30)
            pageView.addSubview(label)
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: images[x])
            pageView.addSubview(imageView)
            
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black
            button.setTitle("Continue", for: .normal)
            if x == 2 {
                 button.setTitle("Get Started", for: .normal)
            }
            pageView.addSubview(button)
            button.tag = x + 1
        }
        
        scrollView.contentSize = CGSize(width: holderView.frame.size.width * 3, height: 0)
        scrollView.isPagingEnabled = true
        
    }
    
    @objc func didTapButton(_ Sender:UIButton)
    {
        guard Sender.tag < 3 else{
            core.shared.setIsNotNewUser()
            dismiss(animated: true, completion: nil)
            return
        }
        //Go to next Page
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(Sender.tag), y: 0), animated: true)
    }
    
}
