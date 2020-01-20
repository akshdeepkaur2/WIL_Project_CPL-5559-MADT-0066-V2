//
//  ProfileViewController.swift
//  Fathce
//
//  Created by Z Angrazy Jatt on 2020-01-20.
//  Copyright © 2020 Psych. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    let transition = MenuSlideTransition()
    var topView:UIView?
    @IBAction func backButtonClicked(_ sender: UIBarButtonItem) {
        // print(menuType)
        guard let menuViewController = storyboard?.instantiateViewController(identifier: "menuViewController") as? MenuViewController else {return}
               menuViewController.didMenutype = {
                    menuType in
                   self.transitionToContent(menuType)
               }
               menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self as? UIViewControllerTransitioningDelegate
               present(menuViewController, animated: true)
    }
    
     func transitionToContent(_ menuType: MenuType) {
            let title = String(describing: menuType).capitalized
            self.title = title
            topView?.removeFromSuperview()
            switch menuType {
            case .profile:
                 nextView()
                
                case .therapyCenter:
                let view = UIView()
                view.backgroundColor = .blue
                view.frame = self.view.bounds
                self.view.addSubview(view)
                self.topView = view
                
                case .home:
                let view = UIView()
                view.backgroundColor = .yellow
                view.frame = self.view.bounds
                self.view.addSubview(view)
                self.topView = view
            default:
                break
            }
        }
    
    func nextView()
    {
        guard let nextView = storyboard?.instantiateViewController(identifier: "ProfileViewController") else {return}
        nextView.modalPresentationStyle = .overCurrentContext
        nextView.transitioningDelegate = nil
        present(nextView, animated: true)
    }
    

}
