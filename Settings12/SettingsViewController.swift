//
//  SettingsViewController.swift
//  Settings12
//
//  Created by Igor Kuzmin on 15.01.2022.
//

import UIKit

struct Setting {
    let name: String
    let switcher: Bool
    let additionalText: String?
    let arrow: UIImage?
}

class SettingsRows {
    static func getSettings() -> [Setting] {
        let settings = [
            Setting(name: "Авиарежим", switcher: true, additionalText: nil, arrow: nil),
            Setting(name: "Wi-Fi", switcher: false, additionalText: "WeLoveYou5TimesMore", arrow: UIImage(named: "forward"))
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

        settingImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        settingImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true

        settingNameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        settingNameLabel.leftAnchor.constraint(equalTo: settingImageView.rightAnchor).isActive = true

        arrowImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        arrowImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        arrowImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        arrowImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true

        additionalTextLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        additionalTextLabel.rightAnchor.constraint(equalTo: arrowImageView.leftAnchor).isActive = true
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
        }
    }

    let settingImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let settingNameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let additionalTextLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let arrowImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

//    let containerView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.clipsToBounds = true
//        return view
//    }()
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

//    override func loadView() {
//        setupTableView()
//    }

    func setupTableView() {
        view.addSubview(settingsTableView)

        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        settingsTableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        settingsTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        settingsTableView.leftAnchor.constraint(equalTo: safeArea.leftAnchor).isActive = true
        settingsTableView.rightAnchor.constraint(equalTo: safeArea.rightAnchor).isActive = true

        settingsTableView.register(SettingTableViewCell.self, forCellReuseIdentifier: "cell")
//        settingsTableView.rowHeight = 44
        settingsTableView.dataSource = self

    }
}

extension SettingsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingTableViewCell
        cell.setting = settings[indexPath.row]
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}

