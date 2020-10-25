//
//  ViewController.swift
//  UsersApp
//
//  Created by David Andres Mejia Lopez on 24/10/20.
//

import UIKit

class UsersListVC: UIViewController {
    
    var tableView = UITableView()
    var users: [User] = []
    
    struct Cells {
        static let userCell = "UserCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users List"
        users = fetchData()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        configureCellSize()
        tableView.register(UserCell.self, forCellReuseIdentifier: Cells.userCell)
        tableView.pin(to: view)
    }
    
    func configureCellSize() {
        tableView.rowHeight = 120
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension UsersListVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.userCell) as! UserCell
        let user = users[indexPath.row]
        cell.set(user: user)
        
        return cell
    }
}

// Generating dumy data
extension UsersListVC {
    func fetchData() -> [User] {
        let user1 = User(id: 1, name: "David", phone: "1234567890", email: "david@email.com")
        let user2 = User(id: 2, name: "Stefania", phone: "2345678901", email: "stefania@email.com")
        
        return [user1, user2]
    }
}
