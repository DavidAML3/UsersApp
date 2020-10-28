//
//  UIColor+Ext.swift
//  UsersApp
//
//  Created by David Andres Mejia Lopez on 27/10/20.
//

import UIKit

extension UIColor {
    
    // App colors
    static let universalCream = UIColor().colorFromHex("F7F9F8")
    static let universalGreen = UIColor().colorFromHex("43693C")
    
    // Font colors
    static let universalCreamF = UIColor().colorFromHex("F8FCF5")
    static let universalGreenF = UIColor().colorFromHex("3B6039")
    
    func colorFromHex(_ hex: String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count != 6 {
            return UIColor.black
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255,
                            green: CGFloat((rgb & 0x00FF00) >> 8) / 255,
                            blue: CGFloat(rgb & 0x0000FF) / 255,
                            alpha: 1.0)
    }
}
