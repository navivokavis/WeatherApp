//
//  Resourses.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 12.12.22.
//

import UIKit

enum Resources {
    
    enum Colors {
        static var whiteBackground = UIColor(hexString: "#FFFFFF")
        static var blackBackground = UIColor(hexString: "#000000")
        static var whiteText = UIColor(hexString: "#FFFFFF")
        static var blackText = UIColor(hexString: "#000000")
//        static var separate = UIColor(hexString: "#D2D2D2")
        static var blueBackground = UIColor(hexString: "#3F84DD")
//        static var redDeleteColor = UIColor(hexString: "#E30000")
//        static var violetBright = UIColor(hexString: "#7363D1")
//        static var greenDark = UIColor(hexString: "#10637D")
//        static var addCommentGray = UIColor(hexString: "#717171")
    }
    
    enum Images {
//            static var hatImage = UIImage(named: "Hat")
//            static var downArrow = UIImage(systemName: "chevron.down")
            static var leftArrow = UIImage(systemName: "chevron.backward")
//            static var moon = UIImage(systemName: "moon.circle")
//            static var sun = UIImage(systemName: "sun.min")
//            static var plus = UIImage(systemName: "plus.bubble.fill")
//            static var checkmarkMessage = UIImage(systemName: "checkmark.message.fill")
//            static var paperplaneFill = UIImage(systemName: "paperplane.fill")
    }

    
    enum String {
        static var headerOnSearch = "Weather"
        static var searchPlaceholder = "Search"
        
    }
    
    enum Fonts {
        
        static func SFProDisplayBold(with size: CGFloat) -> UIFont {
            UIFont(name: "SFProDisplay-Bold",size: size) ?? UIFont()
        }
        static func SFProDisplayMedium(with size: CGFloat) -> UIFont {
            UIFont(name: "SFProDisplay-Medium",size: size) ?? UIFont()
        }
        static func SFProDisplayRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "SFProDisplay-Regular",size: size) ?? UIFont()
        }
        static func SFProDisplayThin(with size: CGFloat) -> UIFont {
            UIFont(name: "SFProDisplay-Thin",size: size) ?? UIFont()
        }
    }
    
}

