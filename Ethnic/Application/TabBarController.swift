import UIKit

final class TabBarController: UITabBarController {
  let home: HomeCoordinator = .init()
  let saved: SavedCoordinator = .init()
  let settings: SettingsCoordinator = .init()

  override func viewDidLoad() {
    super.viewDidLoad()
    viewControllers = [
      home.navigationController,
      saved.navigationController,
      settings.navigationController
    ]
    configureTabBars()
    customizeTabBarsAppearance()
  }

  private func configureTabBars() {
    home.navigationController.tabBarItem = UITabBarItem(
      title: "Переводчик",
      image: UIImage(systemName: "house"),
      selectedImage: UIImage(systemName: "house.fill")
    )

    saved.navigationController.tabBarItem = UITabBarItem(
      title: "Сохраненное",
      image: UIImage(systemName: "star"),
      selectedImage: UIImage(systemName: "star.fill")
    )

    settings.navigationController.tabBarItem = UITabBarItem(
      title: "Настройки",
      image: UIImage(systemName: "gearshape.2"),
      selectedImage: UIImage(systemName: "gearshape.2.fill")
    )
  }

  private func customizeTabBarsAppearance() {
    tabBar.tintColor = .label
    tabBar.unselectedItemTintColor = .secondaryLabel
  }
}
