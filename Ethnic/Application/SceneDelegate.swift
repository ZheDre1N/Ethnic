//
//  SceneDelegate.swift
//  Ethnic
//
//  Created by user205191 on 11/3/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Declaration ViewControllers.
        let homeVC = HomeViewController()
        let savedVC = SavedViewController()
        let settingsVC = SettingsViewController()
        
        // Creating Navigation View Controllers.
        let navigationHomeVC = BaseNavigationController(rootViewController: homeVC)
        let navigationSavedVC = BaseNavigationController(rootViewController: savedVC)
        let navigationSettingsVC = BaseNavigationController(rootViewController: settingsVC)
        let tabBarViewControllers = [navigationHomeVC, navigationSavedVC, navigationSettingsVC]

        
        // Creating a TabBarController.
        let tabBarVC = BaseTabBarController()
        tabBarVC.setViewControllers(tabBarViewControllers, animated: true)
        
        // Configure icons and tab names.
        if let tabBarItem0 = tabBarVC.tabBar.items?[0] {
            tabBarItem0.title = "Home"
            tabBarItem0.image = UIImage(systemName: "m.square.fill")
            tabBarItem0.selectedImage = UIImage(systemName: "m.square")
        }
        
        if let tabBarItem1 = tabBarVC.tabBar.items?[1] {
            tabBarItem1.title = "Saved"
            tabBarItem1.image = UIImage(systemName: "m.square.fill")
            tabBarItem1.selectedImage = UIImage(systemName: "m.square")
        }
        
        if let tabBarItem2 = tabBarVC.tabBar.items?[2] {
            tabBarItem2.title = "Settings"
            tabBarItem2.image = UIImage(systemName: "m.square.fill")
            tabBarItem2.selectedImage = UIImage(systemName: "m.square")
        }
        
        // Configure a window.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

