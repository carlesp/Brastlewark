//
//  GnomeDetailItemCell.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 13/6/22.
//

import UIKit

struct GnomeDetailItemCellViewModel {
    let titleText: String
    let descriptionText: String
}

class GnomeDetailItemCell: UITableViewCell {

    static let reuseIdentifier = String(describing: GnomeDetailItemCell.self)
    static let height = CGFloat(60)
        
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    
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
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        
        contentView.addSubviewWithAutolayout(descriptionLabel)
        let descriptionLabelConstraints = [
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(descriptionLabelConstraints)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .thin)
    }
    
    public func configure(viewModel: GnomeDetailItemCellViewModel) {
        titleLabel.text = viewModel.titleText.uppercased()
        descriptionLabel.text = viewModel.descriptionText
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        backgroundColor = .clear
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        backgroundColor = .clear
    }
}
