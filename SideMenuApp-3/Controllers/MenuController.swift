//
//  MenuController.swift
//  SideMenuApp-3
//
//  Created by Evgeniy Uskov on 25.01.2021.
//

import UIKit

class MenuController: UIViewController {
    // MARK: Properties
    var delegate: MenuControllerDelegate?
    
    var tableView: UITableView!
    
    let options = [1,2,3,4,5]
    //MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

}

//MARK: UITableViewDelegate UITableViewDatasource methods
extension MenuController : UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Ids.menuCellReuseId, for: indexPath) as! MenuCell
        cell.configure(withNumber: options[indexPath.row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.passData(number: options[indexPath.row])
    }
}

extension MenuController {
    private func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuCell.self, forCellReuseIdentifier: Constants.Ids.menuCellReuseId)
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
