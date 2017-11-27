//
//  IntroviewController.swift
//  Dicee
//
//  Created by Felix Haas on 24.11.17.
//  Copyright © 2017 Felix Haas. All rights reserved.
//

import Foundation
import UIKit
import ConfettiView

class introViewController : UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let confettiView = ConfettiView()
//        self.view.addSubview(confettiView)
        // create tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(introViewController.imageTapped(gesture:)))

        // add it to the image view;
        imageView.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
        imageView.isUserInteractionEnabled = true
//        let confettiView = ConfettiView()
//        self.view.addSubview(confettiView)

    }

    @objc func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            print("Image Tapped")
            //Here you can initiate your new ViewController
            let mapViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "gameView") as? ViewController
            let navigationController = UINavigationController(rootViewController: mapViewControllerObj!)
            navigationController.navigationBar.isHidden = true
            self.present(navigationController, animated: true, completion: nil)

        }
    }
    
    
    
    
}
