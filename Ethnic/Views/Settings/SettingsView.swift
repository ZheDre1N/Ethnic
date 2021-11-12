//
//  SettingsView.swift
//  Ethnic
//
//  Created by user208341 on 11/12/21.
//

import UIKit

class SettingsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }
    
    func configureUI() {
        backgroundColor = .secondarySystemBackground
    }
}
