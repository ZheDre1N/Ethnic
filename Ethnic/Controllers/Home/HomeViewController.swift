//
//  HomeViewController.swift
//  Ethnic
//
//  Created by user205191 on 11/3/21.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    // MARK: - Private properties.
    private let homeView = HomeView()
    private let userSettings = UserSettings()
    private let languageBaseManager = LanguageBaseManager()
    
    // MARK: - View controller life cycle.
    override func loadView() {
        view = homeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        declarationActions()
    }
    
    // MARK: - Update UI.
    private func updateUI() {
//        homeView.sourceLanguageButton.setTitle("\(languageBaseManager.getLanguageName(forKey: "\(userSettings.currentSourceLanguageKey)"))", for: .normal)
//        homeView.targetLanguageButton.setTitle("\(languageBaseManager.getLanguageName(forKey: "\(userSettings.currentTargetLanguageKey)"))", for: .normal)
    }
    
    // MARK: - Processing actions.
    private func sourceLanguageButtonWasTapped() {
        homeView.sourceLanguageButtonClosure  = { [weak self] in
            let languageSelectionViewController = LanguageSelectionViewController()
            self?.present(languageSelectionViewController, animated: true) {
                languageSelectionViewController.didSelectLanguage = { [weak self] in
                    // change source language
                    self?.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    private func swapLanguagesButtonWasTapped() {
//        homeView.swapLanguagesButtonClosure  = { [weak self] in
//            print("Tapped 2")
//        }
    }
    
    private func targetLanguageButtonWasTapped() {
        homeView.targetLanguageButtonClosure  = { [weak self] in
            let languageSelectionViewController = LanguageSelectionViewController()
            self?.present(languageSelectionViewController, animated: true) {
                languageSelectionViewController.didSelectLanguage = { [weak self] in
                    // change target language
//                    print("\(languageSelectionViewController.chosenLanguageKey)")
                    self?.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    
    // MARK: - Create targets.
    private func declarationActions() {
        sourceLanguageButtonWasTapped()
        swapLanguagesButtonWasTapped()
        targetLanguageButtonWasTapped()
    }
}
