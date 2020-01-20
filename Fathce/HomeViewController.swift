//
//  ViewController.swift
//  Fathce
//
//  Created by Z Angrazy Jatt on 2020-01-09.
//  Copyright © 2020 Psych. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    let transition = MenuSlideTransition()
    var topView:UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func menuClicked(_ sender: UIBarButtonItem) {
        
        guard let menuViewController = storyboard?.instantiateViewController(identifier: "menuViewController") as? MenuViewController else {return}
        menuViewController.didMenutype = {
             menuType in
            self.transitionToContent(menuType)
           // print(menuType)
                
                
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }
    func transitionToContent(_ menuType: MenuType) {
        let title = String(describing: menuType).capitalized
        self.title = title
        topView?.removeFromSuperview()
        switch menuType {
        case .profile:
             nextView()
//                UIView()
//            view.backgroundColor = .green
//            view.frame = self.view.bounds
//            self.view.addSubview(view)
//            self.topView = view
            
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

extension HomeViewController  :UIViewControllerTransitioningDelegate
{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}

