import UIKit

final class TabBarController: UITabBarController {
  var home: ChildCoordinatable?
  var saved: ChildCoordinatable?
  var settings: ChildCoordinatable?

  init(
    home: ChildCoordinatable,
    saved: ChildCoordinatable,
    settings: ChildCoordinatable
  ) {
    super.init(nibName: nil, bundle: nil)
    self.home = home
    self.saved = saved
    self.settings = settings
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewControllers()
    configureTabBars()
    customizeTabBarsAppearance()
  }

  private func configureViewControllers() {
    viewControllers = [
      home?.navigationController,
      saved?.navigationController,
      settings?.navigationController
    ]
  }

  private func configureTabBars() {
    home?.navigationController.tabBarItem = UITabBarItem(
      title: "Переводчик",
      image: UIImage(systemName: "house"),
      selectedImage: UIImage(systemName: "house.fill")
    )

    saved?.navigationController.tabBarItem = UITabBarItem(
      title: "Сохраненное",
      image: UIImage(systemName: "star"),
      selectedImage: UIImage(systemName: "star.fill")
    )

    settings?.navigationController.tabBarItem = UITabBarItem(
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
