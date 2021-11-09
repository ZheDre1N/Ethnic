//
//  BaseNavigationController.swift
//  Ethnic
//
//  Created by user205191 on 11/3/21.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    enum NavigationBarStyle {
        case classic, homePage
    }
    
    init(rootViewController: UIViewController, style: NavigationBarStyle) {
        super.init(rootViewController: rootViewController)
        // Configure general settings.
        // la-la-la
        
        switch style {
        case .classic:
            
            // Configure classic settings.
            // la-la-la
            
            break
        case .homePage:
            
            // Configure homePage settings.
            let NavBarlogo = UIImageView(image: UIImage(named: "ethnic_logo_sm"))
            
            let navBar = self.navigationBar
            //            navBar.barStyle = .black
            let standardAppearance = UINavigationBarAppearance()
            standardAppearance.configureWithOpaqueBackground()
            
            if let bgImage = UIImage(named: "ethnic_texture") {
                let bgColor = UIColor(patternImage: bgImage)
                standardAppearance.backgroundColor = bgColor
            }
            rootViewController.navigationItem.titleView = NavBarlogo
            //            standardAppearance.backgroundImage = backImageForDefaultBarMetrics
            
            //            let compactAppearance = standardAppearance.copy()
            //            compactAppearance.backgroundImage = backImageForLandscapePhoneBarMetrics
            
            navBar.standardAppearance = standardAppearance
            navBar.scrollEdgeAppearance = standardAppearance
            navBar.compactAppearance = standardAppearance
            
            if #available(iOS 15.0, *) { // For compatibility with earlier iOS.
                navBar.compactScrollEdgeAppearance = standardAppearance
            }
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle  {
            return .lightContent
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
