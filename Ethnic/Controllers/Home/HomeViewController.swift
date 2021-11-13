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
        declarationActions()
    }
    
    // MARK: - Processing actions.
    private func sourceLanguageButtonWasTapped() {
        homeView.sourceLanguageButtonClosure  = { [weak self] in
            print("Tapped 1")
            self?.homeView.sourceLanguageButton.setTitleColor(.red, for: .normal)
        }
    }
    
    private func swapLanguagesButtonWasTapped() {
        homeView.swapLanguagesButtonClosure  = { [weak self] in
            print("Tapped 2")
        }
    }
    
    private func targetLanguageButtonWasTapped() {
        homeView.targetLanguageButtonClosure  = { [weak self] in
            print("Tapped 3")
            self?.homeView.targetLanguageButton.setTitleColor(.green, for: .normal)
        }
    }
    
    
    // MARK: - Create targets.
    private func declarationActions() {
        sourceLanguageButtonWasTapped()
        swapLanguagesButtonWasTapped()
        targetLanguageButtonWasTapped()
    }
}
