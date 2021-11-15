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
    
    // MARK: - View controller life cycle.
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        declarationActions()
    }
    
    // MARK: - Processing actions.
    private func sourceLanguageButtonWasTapped() {
        homeView.sourceLanguageButtonClosure  = { [weak self] in
            let languageSelectionViewController = LanguageSelectionViewController()
            self?.present(languageSelectionViewController, animated: true) {
                languageSelectionViewController.didSelectLanguage = { [weak self] in
                    // change source language
                    print("sourceLang")
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
                    print("targetLang")
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
