//
//  CollectionViewCell.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 31/03/2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(frame: .zero)
        ai.style = .large
        ai.startAnimating()
        return ai
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    private func addViews() {
        self.insertSubview(imageView, at: .zero)
        self.insertSubview(titleLabel, at: 1)
        self.insertSubview(activityIndicator, at: 2)
        imageView.autoLayoutHelper((anchor: self.leadingAnchor, constant: .zero),
                                   (anchor: self.trailingAnchor, constant: .zero),
                                   (anchor: self.topAnchor, constant: .zero),
                                   (anchor: self.bottomAnchor, constant: .zero))
        titleLabel.autoLayoutHelper((anchor: self.leadingAnchor, constant: 25),
                                    (anchor: self.trailingAnchor, constant: 25),
                                    nil,
                                    (anchor: self.bottomAnchor, constant: 25))
        activityIndicator.centerAlignObject(self)
    }
    
    func configureCell(model: ObjectModel ) {
        let image = UIImage(named: model.webImage.url)
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        titleLabel.text = model.title
    }
    
    
}
