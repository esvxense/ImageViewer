//
//  SettingsControllerTableManager.swift
//  ImageViewer
//
//  Created by Alexander Snitko on 28.03.24.
//

import UIKit

protocol SettingsControllerTableManagerProtocol {
    func attach(_ tableView: UITableView)
    // point of customization
    func setDataToTable(buttonTitle: String)
    var aboutTapped: (() -> Void)? { get set }
}

enum SettingsType {
    case about
}

final class SettingsControllerTableManager: NSObject, SettingsControllerTableManagerProtocol {
    private weak var tableView: UITableView?
    private var configurators: [SettingsControllerButtonConfiguratorProtocol] = []
    var aboutTapped: (() -> Void)?
    
    func attach(_ tableView: UITableView) {
        self.tableView = tableView
        configureTableView()
    }
    
    private func configureTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.separatorStyle = .none
        tableView?.tableFooterView = UIView()
        tableView?.register(SettingsControllerButtonTableViewCell.self, forCellReuseIdentifier: String(describing: SettingsControllerButtonTableViewCell.self))
    }
    
    func setDataToTable(buttonTitle: String) {
        var output: [SettingsControllerButtonConfiguratorProtocol] = []
        output.append(createSettingsControllerButtonConfigurator(model: buttonTitle))
        configurators = output
        tableView?.reloadData()
    }
}

extension SettingsControllerTableManager {
    private func createSettingsControllerButtonConfigurator(model: String) -> SettingsControllerButtonConfiguratorProtocol {
        let configurator = SettingsControllerButtonConfigurator()
        configurator.model = model
        configurator.type = .about
        configurator.showAbout = { [weak self] in
            self?.aboutTapped?()
        }
        return configurator
    }
}

extension SettingsControllerTableManager: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        configurators.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let configurator = configurators[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: configurator.reuseId, for: indexPath)
        configurator.setup(cell: cell)
        return cell
    }
}
