//
//  MenuCell.swift
//  SideMenuApp-3
//
//  Created by Evgeniy Uskov on 25.01.2021.
//

import UIKit

class MenuCell: UITableViewCell {
    
    //MARK: Properties
    lazy var label = UILabel.makeMenuLabel()
    
    //MARK: Init methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}

//MARK: Additional methods
extension MenuCell {
    private func configureCell() {
        addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contentView.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: 20),
            
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            contentView.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 5)
        ])
    }
    
    public func configure(withNumber number: Int) {
        backgroundColor = Constants.Colors.backgroundCellColor
        label.text = "Menu Item #\(number)"
    }
}

