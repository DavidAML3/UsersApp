//
//  UserCell.swift
//  UsersApp
//
//  Created by David Andres Mejia Lopez on 25/10/20.
//

import UIKit

class UserCell: UITableViewCell {
    
    var userNameLabel = UILabel()
    var userPhoneLabel = UILabel()
    var userEmailLabel = UILabel()
    var getPublicationsButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(userNameLabel)
        addSubview(userPhoneLabel)
        addSubview(userEmailLabel)
        addSubview(getPublicationsButton)
        
        configureNameLabel()
        configurePhoneLabel()
        configureEmailLabel()
        configurePublicationsButton()
        setNameLabelConstrains()
        setPhoneLabelConstrains()
        setEmailLabelConstrains()
        setPublicationsButtonConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(user: User) {
        userNameLabel.text = user.name
        userPhoneLabel.text = user.phone
        userEmailLabel.text = user.email
    }
    
    func configureNameLabel() {
        userNameLabel.numberOfLines = 0
        userNameLabel.adjustsFontSizeToFitWidth = true
        userNameLabel.textColor = .green
    }
    
    func configurePhoneLabel() {
        userPhoneLabel.numberOfLines = 0
        userPhoneLabel.adjustsFontSizeToFitWidth = true
        userPhoneLabel.textColor = .green
    }
    
    func configureEmailLabel() {
        userEmailLabel.numberOfLines = 0
        userEmailLabel.adjustsFontSizeToFitWidth = true
        userEmailLabel.textColor = .green
    }
    
    func configurePublicationsButton() {
        getPublicationsButton.setTitle("Get publications", for: .normal)
        getPublicationsButton.setTitleColor(.green, for: .normal)
    }
    
    func setNameLabelConstrains() {
        userNameLabel.translatesAutoresizingMaskIntoConstraints                                                 = false
        userNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive                            = true
        userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive                    = true
    }
    
    func setPhoneLabelConstrains() {
        userPhoneLabel.translatesAutoresizingMaskIntoConstraints                                                = false
        userPhoneLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 5).isActive          = true
        userPhoneLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive                   = true
    }
    
    func setEmailLabelConstrains() {
        userEmailLabel.translatesAutoresizingMaskIntoConstraints                                                = false
        userEmailLabel.topAnchor.constraint(equalTo: userPhoneLabel.bottomAnchor, constant: 5).isActive         = true
        userEmailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive                   = true
    }
    
    func setPublicationsButtonConstrains() {
        getPublicationsButton.translatesAutoresizingMaskIntoConstraints                                         = false
        getPublicationsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive          = true
        getPublicationsButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5).isActive              = true
        getPublicationsButton.topAnchor.constraint(equalTo: userEmailLabel.bottomAnchor, constant: 5).isActive  = true
    }
}
