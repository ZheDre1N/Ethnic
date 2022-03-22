//
//  ProfileTableViewCell.swift
//  Ethnic
//
//  Created by Eugene Dudkin on 22.03.2022.
//

import UIKit

struct ProfileCell {
  let title: String
  let icon: UIImage?
  let iconBackgroundColor: UIColor
  let handler: (() -> Void)?
}

class ProfileTableViewCell: UITableViewCell {
  private var iconContainer: UIView = {
    let view = UIView()
    view.clipsToBounds = true
    view.layer.cornerRadius = 8
    view.layer.masksToBounds = true
    return view
  }()

  private let iconImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.tintColor = .white
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  private let firstLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 1
    return label
  }()

  private let secondaryLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 1
    label.textColor = .secondaryLabel
    return label
  }()

  override func sizeThatFits(_ size: CGSize) -> CGSize {
    return CGSize(width: contentView.frame.size.width, height: 64)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    let size: CGFloat = contentView.frame.size.height - 12
    iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)

    let imageSize: CGFloat = size / 1.5
    iconImageView.frame = CGRect(
      x: (size - imageSize) / 2,
      y: (size - imageSize) / 2,
      width: imageSize,
      height: imageSize
    )

    firstLabel.frame = CGRect(
      x: 25 + iconContainer.frame.size.width,
      y: -15,
      width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
      height: contentView.frame.size.height
    )

    secondaryLabel.frame = CGRect(
      x: 25 + iconContainer.frame.size.width,
      y: 15,
      width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
      height: contentView.frame.size.height
    )
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(firstLabel)
    contentView.addSubview(secondaryLabel)
    contentView.addSubview(iconContainer)
    iconContainer.addSubview(iconImageView)
    contentView.clipsToBounds = true
    accessoryType = .disclosureIndicator
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    iconImageView.image = nil
    firstLabel.text = nil
    secondaryLabel.text = nil
    iconContainer.backgroundColor = nil
  }

  public func configure(with model: ProfileCell) {
    firstLabel.text = model.title
    secondaryLabel.text = "Personal & Purchases"
    iconImageView.image = model.icon
    iconContainer.backgroundColor = model.iconBackgroundColor
  }
}
