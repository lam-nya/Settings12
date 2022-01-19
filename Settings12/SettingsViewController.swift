//
//  SettingsViewController.swift
//  Settings12
//
//  Created by Igor Kuzmin on 15.01.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    var safeArea: UILayoutGuide!
    var settingsTableView = UITableView(frame: CGRect.zero, style: .grouped)
    let settings = Setting.getSettings()


    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Settings"
        setupTableView()
    }

    func setupTableView() {

        view = settingsTableView

        settingsTableView.register(SettingTableViewCell.self, forCellReuseIdentifier: "cell")
        settingsTableView.dataSource = self
        settingsTableView.delegate = self
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

extension SettingsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("You have pressed: \(settings[indexPath.section][indexPath.row].name)")
    }

}
