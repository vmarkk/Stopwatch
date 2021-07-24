//
//  SortPresentationPopView.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 24/07/21.
//

import UIKit

class SortPresentationPopView: UIPresentationController {
    
    let blurEffectView: UIVisualEffectView!
    var tapGesture = UITapGestureRecognizer()
    
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        
        let blurEffect = UIBlurEffect(style: .dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismiss))
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.isUserInteractionEnabled = true
        blurEffectView.addGestureRecognizer(tapGesture)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        CGRect(x: 0, y: containerView!.frame.height*0.7, width: containerView!.frame.width, height: containerView!.frame.height*0.3)
    }
    
    override func presentationTransitionWillBegin() {
        blurEffectView.alpha = 0
        containerView!.addSubview(blurEffectView)
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            self.blurEffectView.alpha = 1
        }, completion: { _ in
            
        })
    }
    
    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            self.blurEffectView.alpha = 0
        }, completion: { _ in
            self.blurEffectView.removeFromSuperview()
        })
    }
    
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        presentedView?.roundedCorners([.topLeft, .topRight], radius: 22)
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        presentedView?.frame = frameOfPresentedViewInContainerView
        blurEffectView.frame = containerView!.bounds
    }
    
    
    @objc private func dismiss() {
        
    }

}
