//
//  RoundTabBarControllerViewController.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 20/07/21.
//

import UIKit

class RoundTabBarControllerViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(changeTab), name: Notification.Name("changeTabViewController"), object: nil)
    }
    
    
    @objc private func changeTab() {
        self.selectedIndex = 1
    }

    
    override func viewDidLayoutSubviews() {
        guard self.viewControllers != nil else {return}
        for vc in self.viewControllers! {
            vc.tabBarItem.title = nil
            //     vc.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
            
            var top: CGFloat = self.tabBar.frame.height/5.5
            var bottom: CGFloat = -self.tabBar.frame.height/5.5
            
            if UIScreen.main.bounds.height < 800 {
                top = self.tabBar.frame.size.height/8
                bottom = -self.tabBar.frame.size.height/8
            }
            
            
            if vc == self.viewControllers![0] {
                vc.tabBarItem.imageInsets = UIEdgeInsets(top: top, left: 0, bottom: bottom, right: 0)
            }
            
            if vc == self.viewControllers![1] {
                vc.tabBarItem.imageInsets = UIEdgeInsets(top: top, left: 0, bottom: bottom, right: 0)
                
            }
        }
    }
}
