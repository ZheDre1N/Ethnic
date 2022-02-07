//
//  BaseNavigationController.swift
//  Ethnic
//
//  Created by user205191 on 11/3/21.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    // Private properties.
    private var barStyle = NavigationBarStyle.classic

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    enum NavigationBarStyle {
        case classic
        case homePage
    }
    
    init(rootViewController: UIViewController, style: NavigationBarStyle) {
        super.init(rootViewController: rootViewController)
        
        // Configure general settings.
        barStyle = style

        switch style {
        case .classic:
            
            // Configure classic settings.
            let navBar = self.navigationBar
            let standardAppearance = UINavigationBarAppearance()
            standardAppearance.configureWithOpaqueBackground()
            navBar.standardAppearance = standardAppearance
            navBar.scrollEdgeAppearance = standardAppearance
            navBar.compactAppearance = standardAppearance
            if #available(iOS 15.0, *) { // For compatibility with earlier iOS.
                navBar.compactScrollEdgeAppearance = standardAppearance
            }
            
        case .homePage:
            
            // Configure homePage settings.
            let navBar = self.navigationBar
            
            let standardAppearance = UINavigationBarAppearance()
            let scrollEdgeAppearance = UINavigationBarAppearance()

            standardAppearance.configureWithOpaqueBackground()
            scrollEdgeAppearance.configureWithOpaqueBackground()
            
            if let bgImage = UIImage(named: "ethnic_texture"), let bgImageBlured = UIImage(named: "ethnic_texture_blured") {
                let bgColor = UIColor(patternImage: bgImage)
                let bgColorBlured = UIColor(patternImage: bgImageBlured)
                standardAppearance.backgroundColor = bgColorBlured
                scrollEdgeAppearance.backgroundColor = bgColor
            }
            
            // logoImageView
            let logoImageView = UIImageView(image: UIImage(named: "ethnic-ras-ru"))
            logoImageView.contentMode = .scaleAspectFit
            logoImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
            rootViewController.navigationItem.titleView = logoImageView
                        
            navBar.standardAppearance = standardAppearance
            navBar.scrollEdgeAppearance = scrollEdgeAppearance
            navBar.compactAppearance = standardAppearance
            if #available(iOS 15.0, *) { // For compatibility with earlier iOS.
                navBar.compactScrollEdgeAppearance = scrollEdgeAppearance
            }
            break
        }
}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle  {
        switch barStyle {
        case .classic:
            return .darkContent
        case .homePage:
            return .lightContent
        }
    }
}
