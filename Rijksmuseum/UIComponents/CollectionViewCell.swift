//
//  CollectionViewCell.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 31/03/2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var mainImage: Data? {
        didSet {
            if let mainImageData = mainImage {
                imageView.image = UIImage(data: mainImageData)
            }
        }
    }
    var moreInfoButtonClosure: (() -> ())?
    
    private var moreInfoButton: UIButton = {
        let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 60, height: 60)))
        button.layer.cornerRadius = button.frame.height / 2
        button.clipsToBounds = true
        button.backgroundColor = UIColor(named: "buttonColor")
        var configuration = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium, scale: .large)
        button.setImage(UIImage(systemName: "info", withConfiguration: configuration), for: .normal)
        button.tintColor = UIColor(named: "tintColor")
        button.addTarget(self, action: #selector(moreInfoAction), for: .touchUpInside)
        return button
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: kMainTitleFont, size: 35)
        label.numberOfLines = .zero
        label.textColor = UIColor(named: "textColor")
        return label
    }()
    
    private var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(frame: .zero)
        ai.style = .large
        ai.isHidden = true
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
        
        moreInfoButton.autoLayoutHelper(nil,
                                         (anchor: self.trailingAnchor, constant: -25),
                                         nil,
                                         (anchor: self.bottomAnchor, constant: -50 ), setSize: true)
        
        
        titleLabel.autoLayoutHelper((anchor: self.leadingAnchor, constant: 25),
                                    (anchor: moreInfoButton.leadingAnchor, constant: -10),
                                    nil,
                                    (anchor: self.bottomAnchor, constant: -50), setSize: false)
        
        activityIndicator.centerAlignObject(imageView)
    }
    
    @objc func moreInfoAction() {
        moreInfoButtonClosure?()
    }
    
    var model: ObjectModel? {
        didSet {
            guard let model = model else { return }
            titleLabel.text = model.title.uppercased()
        }
    }
    
    var isLoadingObject: Bool? {
        didSet {
            if let newValue = isLoadingObject {
                activityIndicator.isHidden = newValue ? false : true
                if newValue {
                    activityIndicator.startAnimating()
                    titleLabel.text = "Loading".capitalized
                } else {
                    activityIndicator.stopAnimating()
                }
            }
        }
    }
}
