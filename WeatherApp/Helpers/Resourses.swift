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
        static var blueBackground = UIColor(hexString: "#3F84DD")
    }
    
    enum Images {
            static var leftArrow = UIImage(systemName: "chevron.backward")
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

