//
//  SlideInTrasition.swift
//  MapProject
//
//  Created by Juan Jimenez on 12/23/19.
//  Copyright © 2019 Juan Jimenez. All rights reserved.
//

import UIKit

class SlideInTrasition: NSObject ,UIViewControllerAnimatedTransitioning {

    
    var isPresenting = false /// true cuando se presenta la pantalla false cunado no
    
    var dimmingView = UIView()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViwController = transitionContext.viewController(forKey: .from) else {return}
        //ask our transition context for a contanier view
        //this view is create when we preseting and disming  viewcontroller in the transition
        let contanierView = transitionContext.containerView
        
        let finalWidth = toViewController.view.bounds.width * 0.8
        let finalHeight = toViewController.view.bounds.height
        
        if isPresenting{
            //add dimming View
            dimmingView.backgroundColor = .black
            dimmingView.alpha = 0.0
            contanierView.addSubview(dimmingView)
            dimmingView.frame = contanierView.bounds
            //add menu view controller to container this make the left entry
            contanierView.addSubview(toViewController.view)
            
            //init frame off the scree
            toViewController.view.frame = CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHeight)
        }
        
        //animate con screen
        let  transform = {
            self.dimmingView.alpha = 0.5
            toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
        }
        
        //animate back off the screen
        
        let identity = {
            self.dimmingView.alpha = 0.0
            fromViwController.view.transform = .identity
        }
        
        //here comes the animation
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        
        //animation of the transition
        UIView.animate(withDuration: duration, animations: {
            self.isPresenting ? transform() : identity()
        }) { (_) in
            transitionContext.completeTransition(!isCancelled)
        }
        
        
    }
}
