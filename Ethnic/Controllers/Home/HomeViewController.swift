//
//  HomeViewController.swift
//  Ethnic
//
//  Created by user205191 on 11/3/21.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    // MARK: - Private variables.
    private let languageButtonsHeaderView = UIView()
    private var sourceLanguageButton = BaseButton()
    private var swapLanguagesButton = BaseButton()
    private var targetLanguageButton = BaseButton()
    
    private let sourceTextView = BaseTextView()
    
    private let scrollView = UIScrollView()
    private let contentScrollView = UIView()
    private let targetTextView = BaseTextView()
    
    // MARK: - Public variables.
    public let sourceLanguageKey = "rus"
    public let targetLanguageKey = "myv"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addNavigationButton()
    }
    
    // MARK: METHODS
    private func addNavigationButton() {
        let rightItem = UIButton(type: .system)
        rightItem.setImage(UIImage(named: "menu"), for: .normal)
        rightItem.sizeToFit()
        rightItem.heightAnchor.constraint(equalToConstant: 32).isActive = true
        rightItem.widthAnchor.constraint(equalToConstant: 32).isActive = true
        rightItem.tintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightItem)
        rightItem.addTarget(self, action: #selector(self.someAction), for: .touchUpInside)
    }
    
    @objc func someAction() {
        print("menu")
    }
    
    // MARK: - ConfigureUI
    private func configureUI() {
        configureScrollView()
        configureContentScrollView()
        configureLanguageButtonsHeader()
//        configureSourceTextView()
//        configureAdditionButtonsRow()
        
        func configureScrollView() {
            view.addSubview(scrollView)
            scrollView.backgroundColor = .secondarySystemBackground
            
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
            
        }
        
        func configureContentScrollView() {
            scrollView.addSubview(contentScrollView)
            
            contentScrollView.translatesAutoresizingMaskIntoConstraints = false
            contentScrollView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
            contentScrollView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0).isActive = true
            contentScrollView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0).isActive = true
            contentScrollView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
            contentScrollView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: 0).isActive = true
            contentScrollView.heightAnchor.constraint(equalToConstant: 1500).isActive = true


        }
        
        func configureLanguageButtonsHeader() {
            let height:CGFloat = 50
            
            // Configure languageButtonsHeaderView
            contentScrollView.addSubview(languageButtonsHeaderView)
            languageButtonsHeaderView.backgroundColor = .red
            
            languageButtonsHeaderView.translatesAutoresizingMaskIntoConstraints = false
            languageButtonsHeaderView.heightAnchor.constraint(equalToConstant: height).isActive = true
            languageButtonsHeaderView.topAnchor.constraint(equalTo: contentScrollView.topAnchor, constant: 0).isActive = true
            languageButtonsHeaderView.leftAnchor.constraint(equalTo: contentScrollView.leftAnchor, constant: 0).isActive = true
            languageButtonsHeaderView.rightAnchor.constraint(equalTo: contentScrollView.rightAnchor, constant: 0).isActive = true

            
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
            
            sourceTextView.topAnchor.constraint(equalTo: languageButtonsHeaderView.bottomAnchor, constant: 8).isActive = true
            sourceTextView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
            sourceTextView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
            sourceTextView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
            sourceTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            
            
        }
        
        func configureAdditionButtonsRow() {
            
        }
        
    }
    
    
}
