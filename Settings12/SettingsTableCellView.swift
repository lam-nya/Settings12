//
//  SettingsTableCellView.swift
//  Settings12
//
//  Created by Igor Kuzmin on 19.01.2022.
//

import Foundation
import UIKit

class SettingTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")

        self.contentView.addSubview(settingImageView)
        self.contentView.addSubview(settingNameLabel)
        self.contentView.addSubview(additionalTextLabel)
        self.contentView.addSubview(arrowImageView)
        self.contentView.addSubview(switcherElement)


        settingImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        settingImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
        settingImageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        settingImageView.widthAnchor.constraint(equalToConstant: 28).isActive = true

        settingNameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        settingNameLabel.leftAnchor.constraint(equalTo: settingImageView.rightAnchor, constant: 10).isActive = true

        arrowImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        arrowImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10).isActive = true
        arrowImageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        arrowImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true

        additionalTextLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        additionalTextLabel.rightAnchor.constraint(equalTo: arrowImageView.leftAnchor).isActive = true

        switcherElement.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        switcherElement.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10).isActive = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    var setting: Setting? {
        didSet {
            guard let settingItem = setting else { return }
            settingNameLabel.text = settingItem.name

            if let additionalText = settingItem.additionalText {
                additionalTextLabel.text = additionalText
            }

            if let arrow = settingItem.arrow {
                arrowImageView.image = arrow
            }

            if !settingItem.switcher {
                switcherElement.isHidden = true
            }

            if let icon = settingItem.icon {
                settingImageView.image = icon
            }

        }
    }

    let settingImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    var switcherElement: UISwitch = {
        let switcher = UISwitch()
        switcher.isOn = false

        switcher.translatesAutoresizingMaskIntoConstraints = false
        return switcher
    }()

    let settingNameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let additionalTextLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(13)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let arrowImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

}
