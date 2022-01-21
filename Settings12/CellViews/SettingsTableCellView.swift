//
//  SettingsTableCellView.swift
//  Settings12
//
//  Created by Igor Kuzmin on 19.01.2022.
//

import Foundation
import UIKit

class BasicTableCellView: UITableViewCell {

    let settingImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let settingNameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")

        self.contentView.addSubview(settingImageView)
        self.contentView.addSubview(settingNameLabel)

        settingImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        settingImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
        settingImageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        settingImageView.widthAnchor.constraint(equalToConstant: 28).isActive = true

        settingNameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        settingNameLabel.leftAnchor.constraint(equalTo: settingImageView.rightAnchor, constant: 10).isActive = true

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func configure (with cell: CellSettings) {
        settingImageView.image = cell.icon
        settingNameLabel.text = cell.name
    }

}

class SwitcherTableCellView : BasicTableCellView {

    var switcherElement: UISwitch = {
        let switcher = UISwitch()
        switcher.isOn = false

        switcher.translatesAutoresizingMaskIntoConstraints = false
        return switcher
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")

        self.contentView.addSubview(switcherElement)

        switcherElement.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        switcherElement.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10).isActive = true

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

class ExtendedTableCellView: BasicTableCellView {

    let arrowImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "arrow")
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")

        self.contentView.addSubview(arrowImageView)

        arrowImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        arrowImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10).isActive = true
        arrowImageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        arrowImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

class TextTableCellView: ExtendedTableCellView {

    let additionalTextLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(13)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")

        self.contentView.addSubview(additionalTextLabel)

        additionalTextLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        additionalTextLabel.rightAnchor.constraint(equalTo: arrowImageView.leftAnchor).isActive = true

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

//class SettingTableViewCell: UITableViewCell {
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: "cell")
//
//
//
//
//
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//
//    var setting: Setting? {
//        didSet {
//            guard let settingItem = setting else { return }
//            settingNameLabel.text = settingItem.name
//
//            if let additionalText = settingItem.additionalText {
//                additionalTextLabel.text = additionalText
//            }
//
//            if let arrow = settingItem.arrow {
//                arrowImageView.image = arrow
//            }
//
//            if !settingItem.switcher {
//                switcherElement.isHidden = true
//            }
//
//            if let icon = settingItem.icon {
//                settingImageView.image = icon
//            }
//
//        }
//    }
//
//
//}
