//
//  ExtendedTableCellView.swift
//  Settings12
//
//  Created by Igor Kuzmin on 22.01.2022.
//

import Foundation
import UIKit

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
