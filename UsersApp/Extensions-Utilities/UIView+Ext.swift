//
//  UIView+Ext.swift
//  UsersApp
//
//  Created by David Andres Mejia Lopez on 25/10/20.
//

import UIKit

extension UIView {
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints                               = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive             = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive     = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive   = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive       = true
    }
    
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 1.0
        self.layer.shadowOffset = CGSize(width: 0, height: 1.5)
        self.layer.masksToBounds = false
    }
    
    func addSeparator() {
        let separatorHeight: CGFloat = 20
        let frame = CGRect(x: 0, y: bounds.height - separatorHeight, width: bounds.width, height: separatorHeight)
        let separator = UIView(frame: frame)
        separator.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        separator.autoresizingMask = [.flexibleTopMargin, .flexibleWidth]
        
        addSubview(separator)
    }
}
