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
    private var rightNavigationBarItem = UIButton()
    private var sourceLanguageButton = UIButton()
    private var swapLanguagesButton = UIButton()
    private var targetLanguageButton = UIButton()
    
    // MARK: - Public variables.
    public let sourceLanguageKey = "rus"
    public let targetLanguageKey = "myv"
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTargets()
    }
    
    // MARK: - Processing actions.
    @objc private func rightNavigationButtonWasPressed() {
        print("right button was pressed")
    }
    
    @objc private func sourceLanguageButtonWasPressed() {
        print("source language button was pressed")
    }
    
    @objc private func swapLanguagesButtonWasPressed() {
        print("swap languages button was pressed")
    }
    
    @objc private func targetLanguageButtonWasPressed() {
        print("target language button was pressed")
    }
    
    // MARK: - Create targets.
    private func configureTargets() {
        createRightNavigationBarItem()
        createSourceLanguageButton()
        createSwapLanguagesButton()
        createTargetLanguageButton()
        
        func createRightNavigationBarItem() {
            rightNavigationBarItem = homeView.rightNavigationBarItem
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightNavigationBarItem)
            rightNavigationBarItem.addTarget(self, action: #selector(self.rightNavigationButtonWasPressed), for: .touchUpInside)
        }
        
        func createSourceLanguageButton() {
            sourceLanguageButton = homeView.sourceLanguageButton
            sourceLanguageButton.addTarget(self, action: #selector(self.sourceLanguageButtonWasPressed), for: .touchUpInside)
        }
        
        func createSwapLanguagesButton() {
            swapLanguagesButton = homeView.swapLanguagesButton
            swapLanguagesButton.addTarget(self, action: #selector(self.swapLanguagesButtonWasPressed), for: .touchUpInside)
        }
        
        func createTargetLanguageButton() {
            targetLanguageButton = homeView.targetLanguageButton
            targetLanguageButton.addTarget(self, action: #selector(self.targetLanguageButtonWasPressed), for: .touchUpInside)
        }
    }
}
