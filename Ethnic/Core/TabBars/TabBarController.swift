import UIKit

final class TabBarController: UITabBarController {
  var home: ChildCoordinatable
  var saved: ChildCoordinatable
  var settings: ChildCoordinatable

  init(
    home: ChildCoordinatable,
    saved: ChildCoordinatable,
    settings: ChildCoordinatable
  ) {
    self.home = home
    self.saved = saved
    self.settings = settings
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewControllers()
    configureTabBars()
    customizeTabBarsAppearance()
  }

  private func configureViewControllers() {
    viewControllers = [
      home.navigationController,
      saved.navigationController,
      settings.navigationController
    ]
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
    tabBar.tintColor = .ethnicBlue
    tabBar.unselectedItemTintColor = .secondaryLabel
  }
}
