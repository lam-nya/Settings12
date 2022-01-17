//
//  SettingsViewController.swift
//  Settings12
//
//  Created by Igor Kuzmin on 15.01.2022.
//

import UIKit

struct Setting {
    let icon: UIImage?
    let name: String
    let switcher: Bool
    let additionalText: String?
    let arrow: UIImage?
}

class SettingsRows {
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

class SettingsViewController: UIViewController {

    let settingsTableView = UITableView()
    var safeArea: UILayoutGuide!
    let settings = SettingsRows.getSettings()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Settings"
        view.backgroundColor = .systemGray6
        safeArea = view.layoutMarginsGuide
        setupTableView()
    }

    func setupTableView() {
        view.addSubview(settingsTableView)

        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        settingsTableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        settingsTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        settingsTableView.leftAnchor.constraint(equalTo: safeArea.leftAnchor).isActive = true
        settingsTableView.rightAnchor.constraint(equalTo: safeArea.rightAnchor).isActive = true

        settingsTableView.register(SettingTableViewCell.self, forCellReuseIdentifier: "cell")
        settingsTableView.dataSource = self

    }
}

extension SettingsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingTableViewCell
        cell.setting = settings[indexPath.section][indexPath.row]
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }

}

