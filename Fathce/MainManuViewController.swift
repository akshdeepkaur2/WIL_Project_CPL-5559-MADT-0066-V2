//
//  ProfileViewController.swift
//  Fathce
//
//  Created by Z Angrazy Jatt on 2020-01-20.
//  Copyright © 2020 Psych. All rights reserved.
//

import UIKit

class MainManuViewController: UIViewController {
    let transition = MenuSlideTransition()
    var topView:UIView?
    
    @IBAction func profileBtnClicked(_ sender: UIButton) {
        toProfilePage()
        
    }
    
    
@IBAction func backButtonClicked(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(identifier: "MainPage") as? MenuViewController else {return}
                menuViewController.didMenutype = {
                     menuType in
                    self.transitionToContent(menuType)
                }
                menuViewController.modalPresentationStyle = .overCurrentContext
                menuViewController.transitioningDelegate = self
                present(menuViewController, animated: true)
            }
    
    // profile button
    @IBAction func profileButtonClicked(_ sender: Any) {
        toProfilePage()
    }
    
    //payment page
    @IBAction func paymentButtonClicked(_ sender: Any) {
        toPaymentPage()
    }
    
    // nearby therapy center button
    
    @IBAction func nearByTherapyCenterBtnClciked(_ sender: Any) {
        toNearbyTherapyPage()
    }
    
    
            // menu transition to selected page or view from menu list
            func transitionToContent(_ menuType: MenuType) {
                let title = String(describing: menuType).capitalized
                self.title = title
                topView?.removeFromSuperview()
                switch menuType {
                case .mainpage:
                    mainMenu()
        //
                    case .goback:
                    returnHome()
        //
        //            case .home:
        //            let view = UIView()
        //            view.backgroundColor = .yellow
        //            view.frame = self.view.bounds
        //            self.view.addSubview(view)
        //            self.topView = view
                default:
                    break
                }
            }
            // calling profile page
    func toNearbyTherapyPage()
    {
        guard let nextView = storyboard?.instantiateViewController(identifier: "therapyNearbyPage") else {return}
        nextView.modalPresentationStyle = .overCurrentContext
        nextView.transitioningDelegate = nil
        present(nextView, animated: true)
    }
    
    func toProfilePage()
               {
                   guard let nextView = storyboard?.instantiateViewController(identifier: "profilePage") else {return}
                   nextView.modalPresentationStyle = .overCurrentContext
                   nextView.transitioningDelegate = nil
                   present(nextView, animated: true)
               }
    //calling payment page
    func toPaymentPage()
    {
        guard let nextView = storyboard?.instantiateViewController(identifier: "paymentsPage") else {return}
        nextView.modalPresentationStyle = .overCurrentContext
        nextView.transitioningDelegate = nil
        present(nextView, animated: true)
    }
            // calling profile view
            func mainMenu()
            {
                guard let nextView = storyboard?.instantiateViewController(identifier: "mainManu") else {return}
                nextView.modalPresentationStyle = .overCurrentContext
                nextView.transitioningDelegate = nil
                present(nextView, animated: true)
            }
            
            func returnHome()
            {
                guard let nextView = storyboard?.instantiateViewController(identifier:"navigationController") else {return}
                nextView.modalPresentationStyle = .overCurrentContext
                nextView.transitioningDelegate = nil
                present(nextView, animated: true)
            }
           
        }
        // menu animation extention

extension MainManuViewController  :UIViewControllerTransitioningDelegate
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
