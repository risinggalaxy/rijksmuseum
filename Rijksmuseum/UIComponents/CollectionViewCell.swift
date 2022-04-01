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
    
    var moreInfoButtonClosure: (() -> ())?
    
    private var moreInfoButton: UIButton = {
        let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 75, height: 75)))
        button.layer.cornerRadius = button.frame.height / 2
        button.clipsToBounds = true
        button.backgroundColor = .blue
        var configuration = UIImage.SymbolConfiguration(pointSize: 35, weight: .medium, scale: .large)
        button.setImage(UIImage(systemName: "plus", withConfiguration: configuration), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(moreInfoAction), for: .touchUpInside)
        return button
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
        self.clipsToBounds = true
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(activityIndicator)
        self.addSubview(moreInfoButton)
        imageView.autoLayoutHelper((anchor: self.leadingAnchor, constant: .zero),
                                   (anchor: self.trailingAnchor, constant: .zero),
                                   (anchor: self.topAnchor, constant: .zero),
                                   (anchor: self.bottomAnchor, constant: .zero), setSize: false)
        titleLabel.autoLayoutHelper((anchor: self.leadingAnchor, constant: 25),
                                    (anchor: self.trailingAnchor, constant: 25),
                                    nil,
                                    (anchor: self.bottomAnchor, constant: -50), setSize: false)
        
        activityIndicator.centerAlignObject(imageView)
        
        moreInfoButton.autoLayoutHelper(nil,
                                         (anchor: self.trailingAnchor, constant: -25),
                                         nil,
                                         (anchor: self.bottomAnchor, constant: -50 ), setSize: true)
    }
    
    @objc func moreInfoAction() {
        moreInfoButtonClosure?()
    }
    
    var model: ObjectModel? {
        didSet {
            guard let model = model else { return }
            let image = UIImage(named: model.webImage.url)
            imageView.contentMode = .scaleAspectFill
            imageView.image = image
            titleLabel.text = model.title
        }
    }

}
