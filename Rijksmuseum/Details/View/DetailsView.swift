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
    
    internal var headerImageView: UIImageView = {
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
        tv.isEditable = false
        tv.isSelectable = true
        return tv
    }()
    
    private var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(frame: .zero)
        ai.style = .large
        ai.isHidden = true
        return ai
    }()
    
    func displayErrorLabel(with error: String ) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            let label = UILabel(frame: CGRect(origin: .zero, size: .zero))
            let detailsFont = UIFont(name: kDetailsInfoFont, size: 17)!
            let detailsAtrr: [NSAttributedString.Key: Any] =
            [.font: detailsFont, .foregroundColor: UIColor(named: "textColor")!]
            let str: AttributedString = "\("\(error)", attributes: detailsAtrr)"
            label.attributedText = str.attributedString
            label.textAlignment = .center
            label.numberOfLines = .zero
            strongSelf.headerImageView.addSubview(label)
            label.autoLayoutHelper((anchor: strongSelf.headerImageView.leadingAnchor, constant: 15),
                                   (anchor: strongSelf.headerImageView.trailingAnchor, constant: 15),
                                   (anchor: strongSelf.activityIndicator.bottomAnchor, constant: 10),
                                   (anchor: strongSelf.headerImageView.bottomAnchor, constant: -10),
                                   setSize: false)
        }
    }
    
    var headerImage: Data? {
        didSet {
            guard let imageData = headerImage else {
                displayErrorLabel(with: ErrorHandler.noValidImage.localizedDescription)
                return
            }
            let image = UIImage(data: imageData)
            headerImageView.image = image
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        setupView()
    }
    
    private func setupView() {
        view.addSubview(headerImageView)
        view.addSubview(textView)
        headerImageView.autoLayoutHelper((anchor: view.leadingAnchor, constant: .zero),
                                         (anchor: view.trailingAnchor, constant: .zero),
                                         (anchor: view.topAnchor, constant: .zero),
                                         nil, setSize: true)
        textView.autoLayoutHelper((anchor: view.leadingAnchor, constant: .zero),
                                  (anchor: view.trailingAnchor, constant: .zero),
                                  (anchor: headerImageView.bottomAnchor, constant: .zero),
                                  (anchor: view.bottomAnchor, constant: .zero), setSize: false)
        
        if headerImage == nil {
            headerImageView.addSubview(activityIndicator)
            activityIndicator.centerAlignObject(headerImageView)
            activityIndicator.startAnimating()
        }
        
    }
    
    
    func updateView(with object: ObjectModel) {
        
        let subjectFont = UIFont(name: kDetailsTitleFont, size: 25)!
        let subjectAtrr: [NSAttributedString.Key: Any] =
        [.font: subjectFont, .foregroundColor: UIColor(named: "textColor")!]
        
        let detailsFont = UIFont(name: kDetailsInfoFont, size: 17)!
        let detailsAtrr: [NSAttributedString.Key: Any] =
        [.font: detailsFont, .foregroundColor: UIColor(named: "textColor")!]
        
        let str: AttributedString = """
        \("Title", attributes: subjectAtrr)
        \(object.title, attributes: detailsAtrr)
        
        \("Full Title", attributes: subjectAtrr)
        \(object.longTitle, attributes: detailsAtrr)
        
        \("ID", attributes: subjectAtrr)
        \(object.id, attributes: detailsAtrr)
        
        \("Art Number", attributes: subjectAtrr)
        \(object.objectNumber, attributes: detailsAtrr)
        
        \("First Maker", attributes: subjectAtrr)
        \(object.principalOrFirstMaker, attributes: detailsAtrr)
        """
        textView.attributedText = str.attributedString
    }
    
}
