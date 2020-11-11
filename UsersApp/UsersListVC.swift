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
        setNavigationBar()
        view.backgroundColor = .universalCream
        users = fetchData()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        configureCellSize()
        tableView.register(UserCell.self, forCellReuseIdentifier: Cells.userCell)
        tableView.pin(to: view)
        tableView.backgroundColor = .clear
    }
    
    func configureCellSize() {
        tableView.rowHeight = 150
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }
    
    func setNavigationBar() {
        let navigationTitle = UILabel()
        navigationTitle.text = "User's List"
        navigationTitle.font = navigationTitle.font.withSize(30)
        navigationTitle.textColor = .universalCreamF
        navigationTitle.textAlignment = .left
        navigationTitle.translatesAutoresizingMaskIntoConstraints = false
        
        navigationItem.titleView = navigationTitle
        
        if let navigationBar = navigationController?.navigationBar {
            navigationTitle.widthAnchor.constraint(equalTo: navigationBar.widthAnchor, constant: -40).isActive = true
        }
        
        navigationController?.navigationBar.barTintColor = .universalGreen
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.universalCreamF,
                                                                   NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
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
        if section == 0 {
            return 0
        } else {
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.isUserInteractionEnabled = false
        header.backgroundColor = .clear
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.userCell) as! UserCell
        let user = users[indexPath.section]
        cell.set(user: user)
        cell.addShadow()
        
        return cell
    }
}

// Generating dumy data
extension UsersListVC {
    func fetchData() -> [User] {
        let user1 = User(id: 1, name: "David", phone: "1234567890", email: "david@email.com")
        let user2 = User(id: 2, name: "Stefania", phone: "2345678901", email: "stefania@email.com")
        let user3 = User(id: 3, name: "Carlos", phone: "3456789012", email: "Carlos@email.com")
        let user4 = User(id: 4, name: "Daniel", phone: "4567890123", email: "Daniel@email.com")
        let user5 = User(id: 5, name: "Felipe", phone: "5678901234", email: "Felipe@email.com")
        
        return [user1, user2, user3, user4, user5]
    }
}
