//
//  UINavigationBar + Entension.swift
//  SideMenuApp-3
//
//  Created by Evgeniy Uskov on 25.01.2021.
//

import UIKit

extension UINavigationBar {
    static func getAppearance() -> UINavigationBarAppearance {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = Constants.Colors.backgroundColor
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: Constants.Colors.textColor]
        navBarAppearance.titleTextAttributes = [.foregroundColor: Constants.Colors.textColor]
        return navBarAppearance
    }
}
