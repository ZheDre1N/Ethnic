//
//  LanguageSelectionViewController.swift
//  Ethnic
//
//  Created by user208341 on 11/14/21.
//

import UIKit

final class LanguageSelectionViewController: UIViewController {
    
    // MARK: - Private properties.
    private var languageSelectionView = LanguageSelectionView()
    
    public var didSelectLanguage: (() -> Void)?
    
    // MARK: - View controller life cycle.
    override func loadView() {
        languageSelectionView.table.dataSource = self
        languageSelectionView.table.delegate = self
        languageSelectionView.table.register(UITableViewCell.self, forCellReuseIdentifier: "languageSelectionCell")
        view = languageSelectionView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        declarationActions()
    }
    
    // MARK: - Processing actions.
    private func pageButtonWasTapped() {
        languageSelectionView.pageButtonClosure = { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - Create targets.
    private func declarationActions() {
        pageButtonWasTapped()
    }
}

// MARK: - UITableViewDataSource.
extension LanguageSelectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // declaration cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageSelectionCell", for: indexPath)
        
        // Configure content.
        var content = cell.defaultContentConfiguration()
        content.text = "My language is \(indexPath.row)"
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UITableViewDelegate.
extension LanguageSelectionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return languageSelectionView.searchBar
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectLanguage?()
    }
}
