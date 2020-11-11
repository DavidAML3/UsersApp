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
        userPhoneLabel.attributedText = setIconToLeft(img: images.phone, string: user.phone)
        userEmailLabel.attributedText = setIconToLeft(img: images.mail, string: user.email)
    }
    
    func setIconToLeft(img: UIImage, string: String) -> NSMutableAttributedString {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = img
        
        let imageOffSetY: CGFloat = -5.0
        imageAttachment.bounds = CGRect(x: 0, y: imageOffSetY, width: 10, height: 10)
        
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        
        let completeText = NSMutableAttributedString(string: "")
        completeText.append(attachmentString)
        
        let textAfterIcon = NSAttributedString(string: string)
        completeText.append(textAfterIcon)
        
        return completeText
    }
    
    func configureNameLabel() {
        userNameLabel.numberOfLines = 0
        userNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        userNameLabel.adjustsFontSizeToFitWidth = false
        userNameLabel.textColor = .universalGreenF
    }
    
    func configurePhoneLabel() {
        userPhoneLabel.numberOfLines = 0
        userPhoneLabel.font = userPhoneLabel.font.withSize(16)
        userPhoneLabel.adjustsFontSizeToFitWidth = false
        userPhoneLabel.textColor = .universalGreenF
    }
    
    func configureEmailLabel() {
        userEmailLabel.numberOfLines = 0
        userEmailLabel.font = userEmailLabel.font.withSize(16)
        userEmailLabel.adjustsFontSizeToFitWidth = false
        userEmailLabel.textColor = .universalGreenF
    }
    
    func configurePublicationsButton() {
        getPublicationsButton.setTitle("Get publications", for: .normal)
        getPublicationsButton.setTitleColor(.universalGreenF, for: .normal)
        getPublicationsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func setNameLabelConstrains() {
        userNameLabel.translatesAutoresizingMaskIntoConstraints                                                     = false
        userNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive                               = true
        userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive                       = true
    }
    
    func setPhoneLabelConstrains() {
        userPhoneLabel.translatesAutoresizingMaskIntoConstraints                                                    = false
        userPhoneLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 5).isActive              = true
        userPhoneLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive                      = true
    }
    
    func setEmailLabelConstrains() {
        userEmailLabel.translatesAutoresizingMaskIntoConstraints                                                    = false
        userEmailLabel.topAnchor.constraint(equalTo: userPhoneLabel.bottomAnchor, constant: 5).isActive             = true
        userEmailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive                      = true
    }
    
    func setPublicationsButtonConstrains() {
        getPublicationsButton.translatesAutoresizingMaskIntoConstraints                                             = false
        getPublicationsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive            = true
        getPublicationsButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive                = true
    }
}
