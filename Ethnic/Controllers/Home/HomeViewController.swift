//
//  HomeViewController.swift
//  Ethnic
//
//  Created by user205191 on 11/3/21.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    // MARK: - Private variables.
    private let scrollView = UIScrollView()
    private let contentScrollView = UIView()
    
    private let languageButtonsHeaderView = UIView()
    private var sourceLanguageButton = BaseButton()
    private var swapLanguagesButton = BaseButton()
    private var targetLanguageButton = BaseButton()
    
    private let sourceTextView = BaseTextView()
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
        
        // UI constants.
        let gap: CGFloat = 8
        let viewCornerRadius:CGFloat = 12
        
        configureScrollView()
        configureContentScrollView()
        configureLanguageButtonsHeader()
        configureSourceTextView()
        configureTargetTextView()

        
        


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
            let height:CGFloat = 40
            
            // Configure languageButtonsHeaderView
            contentScrollView.addSubview(languageButtonsHeaderView)
            languageButtonsHeaderView.backgroundColor = .white
            languageButtonsHeaderView.layer.cornerRadius = viewCornerRadius
            languageButtonsHeaderView.layer.borderWidth = 1
            languageButtonsHeaderView.layer.borderColor = UIColor.gray.cgColor
            
            
//            shadowColor sets the color of the shadow, and needs to be a CGColor.
//            shadowOpacity sets how transparent the shadow is, where 0 is invisible and 1 is as strong as possible.
//            shadowOffset sets how far away from the view the shadow should be, to give a 3D offset effect.
//            shadowRadius sets how wide the shadow should be.
            languageButtonsHeaderView.layer.shadowColor = UIColor.black.cgColor
            languageButtonsHeaderView.layer.shadowOpacity = 0.3
            languageButtonsHeaderView.layer.shadowOffset = .zero
            languageButtonsHeaderView.layer.shadowRadius = 8


            
            languageButtonsHeaderView.translatesAutoresizingMaskIntoConstraints = false
            languageButtonsHeaderView.heightAnchor.constraint(equalToConstant: height).isActive = true
            languageButtonsHeaderView.topAnchor.constraint(equalTo: contentScrollView.topAnchor, constant: gap).isActive = true
            languageButtonsHeaderView.leftAnchor.constraint(equalTo: contentScrollView.leftAnchor, constant: gap).isActive = true
            languageButtonsHeaderView.rightAnchor.constraint(equalTo: contentScrollView.rightAnchor, constant: -gap).isActive = true

            
            // Configure buttons.
            sourceLanguageButton.translatesAutoresizingMaskIntoConstraints = false
            sourceLanguageButton.setTitle("Русский", for: .normal)
            sourceLanguageButton.setTitleColor(.black, for: .normal)
            languageButtonsHeaderView.addSubview(sourceLanguageButton)

            swapLanguagesButton.translatesAutoresizingMaskIntoConstraints = false
            swapLanguagesButton.setTitleColor(.black, for: .normal)
            swapLanguagesButton.setTitle("swap", for: .normal)
            languageButtonsHeaderView.addSubview(swapLanguagesButton)

            targetLanguageButton.translatesAutoresizingMaskIntoConstraints = false
            targetLanguageButton.setTitle("Эрзянский", for: .normal)
            targetLanguageButton.setTitleColor(.black, for: .normal)
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
            sourceTextView.backgroundColor = .white
            sourceTextView.layer.cornerRadius = viewCornerRadius
            sourceTextView.layer.borderWidth = 1
            sourceTextView.layer.borderColor = UIColor.gray.cgColor
            
            
//            shadowColor sets the color of the shadow, and needs to be a CGColor.
//            shadowOpacity sets how transparent the shadow is, where 0 is invisible and 1 is as strong as possible.
//            shadowOffset sets how far away from the view the shadow should be, to give a 3D offset effect.
//            shadowRadius sets how wide the shadow should be.
            sourceTextView.layer.shadowColor = UIColor.black.cgColor
            sourceTextView.layer.shadowOpacity = 0.3
            sourceTextView.layer.shadowOffset = .zero
            sourceTextView.layer.shadowRadius = 8
            view.addSubview(sourceTextView)
            
            sourceTextView.topAnchor.constraint(equalTo: languageButtonsHeaderView.bottomAnchor, constant: gap).isActive = true
            sourceTextView.leftAnchor.constraint(equalTo: contentScrollView.leftAnchor, constant: gap).isActive = true
            sourceTextView.rightAnchor.constraint(equalTo: contentScrollView.rightAnchor, constant: -gap).isActive = true
            sourceTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            
            
        }
        
        func configureTargetTextView() {
            targetTextView.translatesAutoresizingMaskIntoConstraints = false
            targetTextView.backgroundColor = .white
            targetTextView.layer.cornerRadius = viewCornerRadius
            targetTextView.layer.borderWidth = 1
            targetTextView.layer.borderColor = UIColor.gray.cgColor
            
            
//            shadowColor sets the color of the shadow, and needs to be a CGColor.
//            shadowOpacity sets how transparent the shadow is, where 0 is invisible and 1 is as strong as possible.
//            shadowOffset sets how far away from the view the shadow should be, to give a 3D offset effect.
//            shadowRadius sets how wide the shadow should be.
            targetTextView.layer.shadowColor = UIColor.black.cgColor
            targetTextView.layer.shadowOpacity = 0.3
            targetTextView.layer.shadowOffset = .zero
            targetTextView.layer.shadowRadius = 8
            view.addSubview(targetTextView)
            
            targetTextView.topAnchor.constraint(equalTo: sourceTextView.bottomAnchor, constant: gap).isActive = true
            targetTextView.leftAnchor.constraint(equalTo: contentScrollView.leftAnchor, constant: gap).isActive = true
            targetTextView.rightAnchor.constraint(equalTo: contentScrollView.rightAnchor, constant: -gap).isActive = true
            targetTextView.heightAnchor.constraint(equalToConstant: 150).isActive = true
            
            
        }
        
    }
    
    
}
