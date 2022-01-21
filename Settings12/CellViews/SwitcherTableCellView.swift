//
//  SwitcherTableCellView.swift
//  Settings12
//
//  Created by Igor Kuzmin on 22.01.2022.
//

import Foundation
import UIKit

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
