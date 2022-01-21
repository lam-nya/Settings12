//
//  SettingsModel.swift
//  Settings12
//
//  Created by Igor Kuzmin on 19.01.2022.
//

import Foundation
import UIKit

enum CellType {
    case SwitcherTableCellView
    case ExtendedTableCellView
    case TextTableCellView
}

struct CellSettings {
    let icon: UIImage
    let name: String
    let additionalText: String?
    let cellType: CellType
}

extension SettingsViewController {
    var settings: [[CellSettings]] {
        get {
            let settings = [
            [
                CellSettings(icon: UIImage(named: "airplane")!, name: "Авиарежим", additionalText: nil, cellType: .SwitcherTableCellView),
                CellSettings(icon: UIImage(named: "wifi")!, name: "Wi-Fi", additionalText: "WeLoveYou5TimesMore", cellType: .TextTableCellView),
                CellSettings(icon: UIImage(named: "bluetooth")!, name: "Bluetooth", additionalText: "Вкл.", cellType: .TextTableCellView),
                CellSettings(icon: UIImage(named: "cellular")!, name: "Сотовая связь", additionalText: nil, cellType: .ExtendedTableCellView),
                CellSettings(icon: UIImage(named: "hotspot")!, name: "Режим модема", additionalText: "Выкл.", cellType: .TextTableCellView),
                CellSettings(icon: UIImage(named: "vpn")!, name: "VPN", additionalText: "Не подключено", cellType: .TextTableCellView)
            ],
            [
                CellSettings(icon: UIImage(named: "notification")!, name: "Уведомления", additionalText: nil, cellType: .ExtendedTableCellView),
                CellSettings(icon: UIImage(named: "sound")!, name: "Звукки, тактильные сигналы", additionalText: nil, cellType: .ExtendedTableCellView),
                CellSettings(icon: UIImage(named: "focus")!, name: "Фокусирование", additionalText: nil, cellType: .ExtendedTableCellView),
                CellSettings(icon: UIImage(named: "displayTime")!, name: "Экраанное время", additionalText: nil, cellType: .ExtendedTableCellView),
            ],
            [
                CellSettings(icon: UIImage(named: "general")!, name: "Основные", additionalText: nil, cellType: .ExtendedTableCellView),
                CellSettings(icon: UIImage(named: "control")!, name: "Пункт управления", additionalText: nil, cellType: .ExtendedTableCellView),
                CellSettings(icon: UIImage(named: "display")!, name: "Экран и яркость", additionalText: nil, cellType: .ExtendedTableCellView),
            ]
        ]
            return settings
        }
    }
}
