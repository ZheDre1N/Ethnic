//
//  StaticTableViewCell.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 22.03.2022.
//

import UIKit

struct DefaultCell {
  let title: String
  let handler: (() -> Void)?
}

class DefaultTableViewCell: UITableViewCell {
  private let label: UILabel = {
    let label = UILabel()
    label.numberOfLines = 1
    label.adjustsFontForContentSizeCategory = true
    label.lineBreakMode = .byWordWrapping
    label.font = UIFont.preferredFont(forTextStyle: .body)
    return label
  }()

  override func layoutSubviews() {
    super.layoutSubviews()

    label.frame = CGRect(
      x: 15,
      y: 0,
      width: contentView.frame.size.width,
      height: contentView.frame.size.height
    )
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(label)
    contentView.clipsToBounds = true
    accessoryType = .disclosureIndicator
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    label.text = nil
  }

  public func configure(with model: DefaultCell) {
    label.text = model.title
  }
}
