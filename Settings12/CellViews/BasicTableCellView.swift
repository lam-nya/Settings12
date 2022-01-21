//
//  BasicTableCellView.swift
//  Settings12
//
//  Created by Igor Kuzmin on 22.01.2022.
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
