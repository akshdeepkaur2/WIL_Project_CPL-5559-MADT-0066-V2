//
//  ViewController.swift
//  Fathce
//
//  Created by Z Angrazy Jatt on 2020-01-09.
//  Copyright © 2020 Psych. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class HomeViewController: UIViewController {
    let transition = MenuSlideTransition()
    var topView:UIView?
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    // menu burger button clicked
    @IBAction func menuClicked(_ sender: UIBarButtonItem) {
        
        guard let menuViewController = storyboard?.instantiateViewController(identifier: "MainPage") as? MenuViewController else {return}
        menuViewController.didMenutype = {
             menuType in
            self.transitionToContent(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }
    
    // adding mapview
    @IBOutlet weak var mapView: MKMapView!
    
    // location button
    @IBAction func findMyLocationBtnClicked(_ sender: Any) {
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
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
        func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            transition.isPresenting = false
            return transition
        }
//        guard let nextView = storyboard?.instantiateViewController(identifier:"navigationController") else {return}
//        nextView.modalPresentationStyle = .overCurrentContext
//        nextView.transitioningDelegate = nil
//        present(nextView, animated: true)
    }
   
}
// menu animation extention
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

