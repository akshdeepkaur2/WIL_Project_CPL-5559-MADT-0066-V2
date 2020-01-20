//
//  MenuSlideTransition.swift
//  Fathce
//
//  Created by Z Angrazy Jatt on 2020-01-15.
//  Copyright © 2020 Psych. All rights reserved.
//

import UIKit

class MenuSlideTransition: NSObject, UIViewControllerAnimatedTransitioning {
    var isPresenting = false
    let dimmingView = UIView()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toViewController = transitionContext.viewController(forKey: .to) else { return }
        guard let fromViewController = transitionContext.viewController(forKey: .from) else { return }
        let containerView = transitionContext.containerView
        let finalWidhth = toViewController.view.bounds.width * 0.7
        let finalHeight = toViewController.view.bounds.height
        if isPresenting {
            // adding dimming View
            dimmingView.backgroundColor = .blue
            dimmingView.alpha = 0.0
            //adding menuViewController to container
            containerView.addSubview(toViewController.view)
            dimmingView.frame = containerView.bounds
            //init the frame
            toViewController.view.frame = CGRect(x: -finalWidhth, y: 0, width: finalWidhth, height: finalHeight)
        }
        // animating to screen
        let transform =
        {   self.dimmingView.alpha = 0.5
            toViewController.view.transform = CGAffineTransform(translationX: finalWidhth, y: 0)
        }
        
        // animate from screen (back)
        
        let id = {
            self.dimmingView.alpha = 0.0
            fromViewController.view.transform = .identity }
        
        // animating the transition
        let duration = transitionDuration(using: transitionContext)
        let isCanceled = transitionContext.transitionWasCancelled
        
        
        UIView.animate(withDuration: duration, animations: {self.isPresenting ? transform():id()})
        {
            (_) in
            transitionContext.completeTransition(!isCanceled)
        }
        
    }
    

}
