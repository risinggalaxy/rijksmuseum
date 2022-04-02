//
//  DetailsView.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

class DetailsView: UIViewController, DetailsViewInterface {
    
    var presenter: DetailsPresenterInterface?
    private static let screenSize = UIScreen.main.bounds
    
    internal var headerImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: screenSize.width, height: 200)))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    internal var textView: UITextView = {
        let tv = UITextView(frame: .zero)
        tv.font = UIFont(name: "Avenir Medium", size: 18)
        tv.contentInset = UIEdgeInsets(top: 20, left: 10, bottom: 35, right: 10)
        tv.textColor = UIColor(named: "textColor")
        tv.text = nil
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        setupImageView()
        setupTextView()
    }
    
    private func setupImageView() {
        view.addSubview(headerImage)
        view.addSubview(textView)
        headerImage.autoLayoutHelper((anchor: view.leadingAnchor, constant: .zero),
                                     (anchor: view.trailingAnchor, constant: .zero),
                                     (anchor: view.topAnchor, constant: .zero),
                                     nil, setSize: true)
        textView.autoLayoutHelper((anchor: view.leadingAnchor, constant: .zero),
                                  (anchor: view.trailingAnchor, constant: .zero),
                                  (anchor: headerImage.bottomAnchor, constant: .zero),
                                  (anchor: view.bottomAnchor, constant: .zero), setSize: false)
    }
    
    private func setupTextView() {
        
 
    }
    
    func updateView(with object: ObjectModel) {
        headerImage.image = UIImage(named: object.headerImage.url)
        textView.text = """
                Title: \(object.title)
                Full Title: \(object.longTitle)
                ID: \(object.id)
                Art Number: \(object.objectNumber)
                First Maker: \(object.principalOrFirstMaker)
                """
    }
    
}

