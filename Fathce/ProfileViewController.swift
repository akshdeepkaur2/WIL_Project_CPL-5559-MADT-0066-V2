//
//  ProfileViewController.swift
//  Fathce
//
//  Created by Z Angrazy Jatt on 2020-01-20.
//  Copyright © 2020 Psych. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBAction func backButtonClicked(_ sender: UIBarButtonItem) {
        
        guard let nextView = storyboard?.instantiateViewController(identifier: "HomeView") else {return}
        nextView.modalPresentationStyle = .overCurrentContext
        nextView.transitioningDelegate = nil
        present(nextView, animated: true)
    }
    

}
