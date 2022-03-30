//
//  SavedTableViewCell.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 20.03.2022.
//

import UIKit

class SavedTableViewCell: UITableViewCell {
  @IBOutlet weak var sourceLanguageLabel: UILabel!
  @IBOutlet weak var sourceTextLabel: UILabel!
  @IBOutlet weak var targetLanguageLabel: UILabel!
  @IBOutlet weak var targetTextLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    configureCellAppearence()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }

  private func configureCellAppearence() {
    //
  }
}

extension SavedTableViewCell {
  func configureCellData(with model: Translation) {
    self.sourceLanguageLabel.text = model.sourceLanguage.name
    self.sourceTextLabel.text = model.sourceText
    self.targetLanguageLabel.text = model.targetLanguage.name
    self.targetTextLabel.text = model.targetText
  }
}
