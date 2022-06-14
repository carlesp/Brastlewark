//
//  GnomesListItemCell.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import UIKit

class GnomesListItemCell: UITableViewCell {

    static let reuseIdentifier = String(describing: GnomesListItemCell.self)
    static let height = CGFloat(60)
        
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpUI()
    }
    
    private func setUpUI() {
        contentView.addSubviewWithAutolayout(titleLabel)
        let titleLabelConstraints = [
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    public func configure(with gnome: Gnome) {
        titleLabel.text = gnome.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        backgroundColor = .clear
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        backgroundColor = .clear
    }
    
}
