//
//  HomeViewController.swift
//  Ethnic
//
//  Created by user205191 on 11/3/21.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    // MARK: - Private variables.
    private let homeView = HomeView()
    
    // MARK: - Public variables.
    public let sourceLanguageKey = "rus"
    public let targetLanguageKey = "myv"
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
