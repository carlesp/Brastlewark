//
//  GnomeDetailHeaderView.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 13/6/22.
//

import Foundation
import UIKit

class GnomeDetailHeaderView: UITableViewCell {

    static let reuseIdentifier = String(describing: GnomeDetailHeaderView.self)
    static let height = CGFloat(200)
    
    private var imageLoadTask: Cancellable? {
        willSet {
            imageLoadTask?.cancel()
        }
    }
    
    let thumbnailImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpUI()
    }
    
    private func setUpUI() {
        contentView.addSubviewWithAutolayout(thumbnailImageView)
        let thumbnailImageViewConstraints = [
            thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            thumbnailImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            thumbnailImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            thumbnailImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(thumbnailImageViewConstraints)
        thumbnailImageView.contentMode = .scaleAspectFit
    }
    
    public func configure(gnome: Gnome, thumbnailUseCase: GetGnomesThumbnailUseCase) {
        imageLoadTask = thumbnailUseCase.execute(url: URL(string: gnome.thumbnail)!) { [weak self] result in
            guard let strongSelf = self else { return }
            if case .success(let data) = result {
                strongSelf.thumbnailImageView.image = UIImage(data: data)
            }
            strongSelf.imageLoadTask = nil
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        backgroundColor = .clear
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        backgroundColor = .clear
    }
}
