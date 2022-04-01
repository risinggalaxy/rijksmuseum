//
//  AutoLayoutHelper.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 31/03/2022.
//

import UIKit

extension UIView {
    
    func autoLayoutHelper( _ leadingAnchor: (anchor: NSLayoutXAxisAnchor, constant: CGFloat)?,
                           _ trailingAnchor: (anchor: NSLayoutXAxisAnchor, constant: CGFloat)?,
                           _ topAnchor: (anchor: NSLayoutYAxisAnchor, constant: CGFloat)?,
                           _ bottomAnchor: (anchor: NSLayoutYAxisAnchor, constant: CGFloat)?, setSize: Bool) {
        if leadingAnchor != nil {
            self.leadingAnchor.constraint(equalTo: leadingAnchor!.anchor, constant: leadingAnchor!.constant).isActive = true
        }
        if trailingAnchor != nil {
            self.trailingAnchor.constraint(equalTo: trailingAnchor!.anchor, constant: trailingAnchor!.constant).isActive = true
        }
        if topAnchor != nil {
            self.topAnchor.constraint(equalTo: topAnchor!.anchor, constant: topAnchor!.constant).isActive = true
        }

        if bottomAnchor != nil {
            self.bottomAnchor.constraint(equalTo: bottomAnchor!.anchor, constant: bottomAnchor!.constant).isActive = true
        }
        if setSize {
        self.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        self.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
        }
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func centerAlignObject( _ parentView: UIView ) {
        self.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }

}
