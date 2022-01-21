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

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Settings"
        setupTableView()
    }

    func setupTableView() {

        view = settingsTableView

        settingsTableView.register(TextTableCellView.self, forCellReuseIdentifier: "TextCell")
        settingsTableView.register(ExtendedTableCellView.self, forCellReuseIdentifier: "ExtendedCell")
        settingsTableView.register(SwitcherTableCellView.self, forCellReuseIdentifier: "SwitcherCell")
        settingsTableView.dataSource = self
        settingsTableView.delegate = self
    }

}

extension SettingsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCell = settings[indexPath.section][indexPath.row]
        switch currentCell.cellType {
            case .SwitcherTableCellView:
                let cell = settingsTableView.dequeueReusableCell(withIdentifier: "SwitcherCell", for: indexPath) as! SwitcherTableCellView
                cell.configure(with: currentCell)
                return cell
            case .ExtendedTableCellView:
                let cell = settingsTableView.dequeueReusableCell(withIdentifier: "ExtendedCell", for: indexPath) as! ExtendedTableCellView
                cell.configure(with: currentCell)
        
                return cell
            case .TextTableCellView:
                let cell = settingsTableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextTableCellView
                cell.configure(with: currentCell)
                return cell
        }

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
