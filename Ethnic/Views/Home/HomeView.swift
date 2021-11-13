//
//  HomeView.swift
//  Ethnic
//
//  Created by user208341 on 11/11/21.
//

import UIKit

final class HomeView: UIView{
    
    // MARK: - Private variables.
    private let scrollView = UIScrollView()
    private let contentScrollView = UIView()
    private let languageButtonsHeaderView = UIView()
    private let sourceTextView = UITextView()
    private let targetTextView = UITextView()
    
    // MARK: - Public variables.
    public var rightNavigationBarItem = UIButton()
    public let sourceLanguageButton = UIButton()
    public let swapLanguagesButton = UIButton()
    public let targetLanguageButton = UIButton()
    
    // MARK: - Configure init.
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }
    
    // MARK: - Configure UI.
    private func configureUI() {
        
        // UI constants.
        let gap: CGFloat = 8
        let viewCornerRadius:CGFloat = 12
        let bgColor = UIColor.secondarySystemBackground
        
        // List of content. Personal settings.
        configureScrollView()
        configureContentScrollView()
        configureRightNavigationBarItem()
        configureLanguageButtonsHeader()
        configureSourceTextView()
        configureTargetTextView()
        
        // List of helpers functions. General settings.
        configureStandardView(for: languageButtonsHeaderView)
        configureStandardView(for: sourceTextView)
        configureStandardView(for: targetTextView)
        
        func configureStandardView(for view: UIView) {
            view.backgroundColor = .white
            view.layer.cornerRadius = viewCornerRadius
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.lightGray.cgColor
            
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOpacity = 0.3
            view.layer.shadowOffset = .zero
            view.layer.shadowRadius = 8
        }
        
        
        func configureScrollView() {
            addSubview(scrollView)
            scrollView.backgroundColor = bgColor
            
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
            scrollView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
            scrollView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
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
        
        func configureRightNavigationBarItem() {
            rightNavigationBarItem = UIButton(type: .system)
            rightNavigationBarItem.setImage(UIImage(named: "menu"), for: .normal)
            rightNavigationBarItem.sizeToFit()
            rightNavigationBarItem.heightAnchor.constraint(equalToConstant: 32).isActive = true
            rightNavigationBarItem.widthAnchor.constraint(equalToConstant: 32).isActive = true
            rightNavigationBarItem.tintColor = .white
        }
        
        func configureLanguageButtonsHeader() {
            let height:CGFloat = 40
            
            // Configure languageButtonsHeaderView
            contentScrollView.addSubview(languageButtonsHeaderView)
            
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
            
            addSubview(sourceTextView)
            
            sourceTextView.translatesAutoresizingMaskIntoConstraints = false
            sourceTextView.topAnchor.constraint(equalTo: languageButtonsHeaderView.bottomAnchor, constant: gap).isActive = true
            sourceTextView.leftAnchor.constraint(equalTo: contentScrollView.leftAnchor, constant: gap).isActive = true
            sourceTextView.rightAnchor.constraint(equalTo: contentScrollView.rightAnchor, constant: -gap).isActive = true
            sourceTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        }
        
        func configureTargetTextView() {
            
            addSubview(targetTextView)
            
            targetTextView.translatesAutoresizingMaskIntoConstraints = false
            targetTextView.topAnchor.constraint(equalTo: sourceTextView.bottomAnchor, constant: gap).isActive = true
            targetTextView.leftAnchor.constraint(equalTo: contentScrollView.leftAnchor, constant: gap).isActive = true
            targetTextView.rightAnchor.constraint(equalTo: contentScrollView.rightAnchor, constant: -gap).isActive = true
            targetTextView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        }
    }
}




