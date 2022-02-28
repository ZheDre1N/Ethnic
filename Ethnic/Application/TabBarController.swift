import UIKit

final class TabBarController: UITabBarController {
    
    let home = HomeRouter()
    let saved = SavedRouter()
    let settings = SettingsRouter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            home.navigationController,
            saved.navigationController,
            settings.navigationController
        ]
        
        configureTabBars()
        customizeAppearance()
    }
    
    private func configureTabBars() {
        home.navigationController.tabBarItem = UITabBarItem(title: "Переводчик", image: UIImage(systemName: "house"), tag: 0)
        home.navigationController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        saved.navigationController.tabBarItem = UITabBarItem(title: "Сохраненное", image: UIImage(systemName: "star"), tag: 1)
        saved.navigationController.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
        settings.navigationController.tabBarItem = UITabBarItem(title: "Настройки", image: UIImage(systemName: "gearshape.2"), tag: 2)
        settings.navigationController.tabBarItem.selectedImage = UIImage(systemName: "gearshape.2.fill")
    }
    
    private func customizeAppearance() {
        tabBar.tintColor = .label
        tabBar.unselectedItemTintColor = .secondaryLabel
    }
}
