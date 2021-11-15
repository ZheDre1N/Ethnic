//
//  SavedViewController.swift
//  Ethnic
//
//  Created by user205191 on 11/3/21.
//

import UIKit

class SavedViewController: BaseViewController {

    // MARK: - Private properties.
    private var savedView = SavedView()
    
    // MARK: - View controller life cycle.
    override func loadView() {
        view = savedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Сохраненное"
        // Do any additional setup after loading the view.
    }
}
