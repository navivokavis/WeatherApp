//
//  UINavigationController + Ext.swift
//  WeatherApp
//
//  Created by Navi Vokavis on 12.12.22.
//

import UIKit

extension UINavigationController {
    
    func setStatusBar(backgroundColor: UIColor) {
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }
 
    func setupNavigationController() {
//        self.navigationBar.backgroundColor = Resources.Colors.blackBackground
//        self.navigationController?.navigationBar
        self.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
//        self.navigationBar.standardAppearance.titleTextAttributes = [
//            .foregroundColor: Resources.Colors.whiteText,
//            .font: Resources.Fonts.SFProDisplayBold(with: 34),
//        ]
        
//        self.setStatusBar(backgroundColor: Resources.Colors.blackBackground)
//        self.navigationBar.addBottomBorder(wiht: Resources.Colors.separator, height: 1)
    }
    

    
}
