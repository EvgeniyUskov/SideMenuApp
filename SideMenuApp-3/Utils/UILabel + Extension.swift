//
//  UIHelper.swift
//  SideMenuApp-3
//
//  Created by Evgeniy Uskov on 25.01.2021.
//

import UIKit

//MARK: UILabel
extension UILabel {
    
    static func makeVCLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(UILayoutPriority.init(251), for: .horizontal)
        label.setContentHuggingPriority(UILayoutPriority.init(251), for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority.init(751), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority.init(750), for: .vertical)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 360, weight: .light)
        label.textColor = Constants.Colors.textColor
        return label
    }
    
    static func makeMenuLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.setContentHuggingPriority(UILayoutPriority.init(250), for: .horizontal)
        label.setContentHuggingPriority(UILayoutPriority.init(251), for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority.init(750), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority.init(750), for: .vertical)
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = Constants.Colors.textColor
        return label
    }
}
