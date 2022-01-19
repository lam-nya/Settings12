//
//  SettingsModel.swift
//  Settings12
//
//  Created by Igor Kuzmin on 19.01.2022.
//

import Foundation
import UIKit

struct Setting {
    let icon: UIImage?
    let name: String
    let switcher: Bool
    let additionalText: String?
    let arrow: UIImage?
}
// Все это нужно вынести в отдельный файл. все классы структуры и тд должны лежать в отдельных файлах и сделай иерархию файлов.

extension Setting {
    static func getSettings() -> [[Setting]] {
        let settings = [
            [
                Setting(icon: UIImage(named: "airplane"), name: "Авиарежим", switcher: true, additionalText: nil, arrow: nil),
                Setting(icon: UIImage(named: "wifi"), name: "Wi-Fi", switcher: false, additionalText: "WeLoveYou5TimesMore", arrow: UIImage(named: "forward")),
                Setting(icon: UIImage(named: "bluetooth"), name: "Bluetooth", switcher: false, additionalText: "Вкл.", arrow: UIImage(named: "forward")),
                Setting(icon: UIImage(named: "cellular"), name: "Сотовая связь", switcher: false, additionalText: nil, arrow: UIImage(named: "forward")),
                Setting(icon: UIImage(named: "hotspot"), name: "Режим модема", switcher: false, additionalText: "Выкл.", arrow: UIImage(named: "forward")),
                Setting(icon: UIImage(named: "vpn"), name: "VPN", switcher: false, additionalText: "Не подключено", arrow: UIImage(named: "forward"))
            ],
            [
                Setting(icon: UIImage(named: "notification"), name: "Уведомления", switcher: false, additionalText: nil, arrow: UIImage(named: "forward")),
                Setting(icon: UIImage(named: "sound"), name: "Звукки, тактильные сигналы", switcher: false, additionalText: nil, arrow: UIImage(named: "forward")),
                Setting(icon: UIImage(named: "focus"), name: "Фокусирование", switcher: false, additionalText: nil, arrow: UIImage(named: "forward")),
                Setting(icon: UIImage(named: "displayTime"), name: "Экраанное время", switcher: false, additionalText: nil, arrow: UIImage(named: "forward")),
            ],
            [
                Setting(icon: UIImage(named: "general"), name: "Основные", switcher: false, additionalText: nil, arrow: UIImage(named: "forward")),
                Setting(icon: UIImage(named: "control"), name: "Пункт управления", switcher: false, additionalText: nil, arrow: UIImage(named: "forward")),
                Setting(icon: UIImage(named: "display"), name: "Экран и яркость", switcher: false, additionalText: nil, arrow: UIImage(named: "forward")),
            ]
        ]
        return settings
    }
}
