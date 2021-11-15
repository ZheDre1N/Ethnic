//
//  LanguageSelectionView.swift
//  Ethnic
//
//  Created by user208341 on 11/14/21.
//

import UIKit

final class LanguageSelectionView: UIView {
    
    // MARK: - Public properties.
    public var headerView = UIView()
    public var pageLabel = UILabel()
    public var pageButton = UIButton()
    public var searchBar = UISearchBar()
    public var table = UITableView()
    
    // MARK: - Public closures.
    public var pageButtonClosure: (() -> Void)?
    
    // MARK: - Private variables.
    
    // MARK: - Configure inits.
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure targets.
    func configureTargets() {
        pageButton.addTarget(self, action: #selector(pageButtonWasPressed), for: .touchUpInside)
    }
    
    // MARK: - Setup actions.
    @objc private func pageButtonWasPressed() {
        pageButtonClosure?()
    }
    
    // MARK: - Configure UI.
    private func configureUI() {
        backgroundColor = .secondarySystemBackground
        configureHeaderView()
        configureTable()
        
        func configureHeaderView() {
            
            addSubview(headerView)
            headerView.translatesAutoresizingMaskIntoConstraints = false
            headerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            headerView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
            headerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            
            configurePageButton()
            configurePageLabel()
            configureSearchBar()
            
            func configurePageButton() {
                pageButton = UIButton(type: .close)
                headerView.addSubview(pageButton)
                pageButton.translatesAutoresizingMaskIntoConstraints = false
                pageButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 12).isActive = true
                pageButton.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -12).isActive = true
                pageButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
                pageButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
                pageButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -12).isActive = true
            }
            
            func configurePageLabel() {
                headerView.addSubview(pageLabel)
                pageLabel.textAlignment = .left
                pageLabel.text = "Исходный язык / Язык перевода"
                pageLabel.numberOfLines = 0
                pageLabel.font = UIFont.boldSystemFont(ofSize: 16)
                pageLabel.sizeToFit()
                pageLabel.translatesAutoresizingMaskIntoConstraints = false
                pageLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
                pageLabel.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 12).isActive = true
                pageLabel.rightAnchor.constraint(lessThanOrEqualTo: pageButton.leftAnchor, constant: -16).isActive = true

            }
            
            func configureSearchBar() {
                // do nothing =/
            }
            
        }
        
        func configureTable() {
            table = UITableView(frame: CGRect(), style: .grouped)
            addSubview(table)
            table.translatesAutoresizingMaskIntoConstraints = false
            table.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            table.topAnchor.constraint(equalTo: self.headerView.bottomAnchor).isActive = true
            table.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            table.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
    }
}
