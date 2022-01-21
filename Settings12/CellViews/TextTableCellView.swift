//
//  TextTableCellView.swift
//  Settings12
//
//  Created by Igor Kuzmin on 22.01.2022.
//

import Foundation
import UIKit

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

    override func configure (with cell: CellSettings) {
        settingImageView.image = cell.icon
        settingNameLabel.text = cell.name
        additionalTextLabel.text = cell.additionalText
    }

}
