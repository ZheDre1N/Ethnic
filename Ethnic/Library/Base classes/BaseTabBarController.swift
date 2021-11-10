//
//  BaseTabBarController.swift
//  Ethnic
//
//  Created by user205191 on 11/3/21.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func customizeAppearance() {
        //Set the background color
//            UITabBar.appearance().backgroundColor = .red
            tabBar.backgroundImage = UIImage()   //Clear background

            //Set the item tint colors
            tabBar.tintColor = .black
            tabBar.unselectedItemTintColor = .black
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
