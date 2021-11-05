//
//  HomeViewController.swift
//  Ethnic
//
//  Created by user205191 on 11/3/21.
//

import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - Private variables.
    private let sourceTextView = BaseTextView()
    private let targetTextView = BaseTextView()
    private var sourceLanguageButton = BaseButton()
    private var targetLanguageButton = BaseButton()
    private var swapLanguagesButton = BaseButton()
    private let languageButtonsHeaderView = UIView()
    private let additionTranslateButtonsView = UIView()


    // MARK: - Public variables.
    public let sourceLanguageKey = "rus"
    public let targetLanguageKey = "myv"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - ConfigureUI
    private func configureUI() {
        title = "Home"
        configureLanguageButtonsHeader()
        configureSourceTextView()
        configureAdditionButtonsRow()
        
        func configureLanguageButtonsHeader() {
            let languageButtonsHeaderViewHeight:CGFloat = 45
            
            // Configure languageButtonsHeaderView
            view.addSubview(languageButtonsHeaderView)
            languageButtonsHeaderView.translatesAutoresizingMaskIntoConstraints = false
            languageButtonsHeaderView.heightAnchor.constraint(equalToConstant: languageButtonsHeaderViewHeight).isActive = true
            languageButtonsHeaderView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
            languageButtonsHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            languageButtonsHeaderView.backgroundColor = .cyan
            
            // Configure buttons.
            sourceLanguageButton.translatesAutoresizingMaskIntoConstraints = false
            sourceLanguageButton.setTitle("Русский", for: .normal)
            languageButtonsHeaderView.addSubview(sourceLanguageButton)

            swapLanguagesButton.translatesAutoresizingMaskIntoConstraints = false
            swapLanguagesButton.setTitle("swap", for: .normal)
            swapLanguagesButton.backgroundColor = .green
            languageButtonsHeaderView.addSubview(swapLanguagesButton)
            
            targetLanguageButton.translatesAutoresizingMaskIntoConstraints = false
            targetLanguageButton.setTitle("Эрзянский", for: .normal)
            languageButtonsHeaderView.addSubview(targetLanguageButton)
            
            // Constraint buttons.
            sourceLanguageButton.leftAnchor.constraint(equalTo: languageButtonsHeaderView.leftAnchor).isActive = true
            sourceLanguageButton.centerYAnchor.constraint(equalTo: swapLanguagesButton.centerYAnchor).isActive = true
            sourceLanguageButton.rightAnchor.constraint(equalTo: swapLanguagesButton.leftAnchor).isActive = true

            swapLanguagesButton.heightAnchor.constraint(equalTo: languageButtonsHeaderView.heightAnchor).isActive = true
            swapLanguagesButton.widthAnchor.constraint(equalTo: languageButtonsHeaderView.heightAnchor).isActive = true
            swapLanguagesButton.centerXAnchor.constraint(equalTo: languageButtonsHeaderView.centerXAnchor).isActive = true
            
            targetLanguageButton.leftAnchor.constraint(equalTo: swapLanguagesButton.rightAnchor).isActive = true
            targetLanguageButton.centerYAnchor.constraint(equalTo: swapLanguagesButton.centerYAnchor).isActive = true
            targetLanguageButton.rightAnchor.constraint(equalTo: languageButtonsHeaderView.rightAnchor).isActive = true
        }
        
        func configureSourceTextView() {
            sourceTextView.translatesAutoresizingMaskIntoConstraints = false
            sourceTextView.backgroundColor = .lightGray
            view.addSubview(sourceTextView)

            sourceTextView.topAnchor.constraint(equalTo: languageButtonsHeaderView.bottomAnchor).isActive = true
            sourceTextView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
            sourceTextView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
            sourceTextView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
            sourceTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            

        }
        
        func configureAdditionButtonsRow() {
            
        }
        
    }


}
