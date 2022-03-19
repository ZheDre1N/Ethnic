//
//  ChildCoordinatable.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 19.03.2022.
//

import UIKit

protocol ChildCoordinatable: AppCoordinatable {
  var navigationController: UINavigationController { get set }
}
