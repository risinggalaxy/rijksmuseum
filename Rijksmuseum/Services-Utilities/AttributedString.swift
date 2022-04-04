//
//  AttributedString.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 04/04/2022.
//

import UIKit

struct AttributedString {
    let attributedString: NSAttributedString
}

extension AttributedString: ExpressibleByStringLiteral {
    init(stringLiteral: String) {
        self.attributedString = NSAttributedString(string: stringLiteral)
    }
}

extension AttributedString: CustomStringConvertible {
    var description: String {
        return String(describing: self.attributedString)
    }
}

extension AttributedString: ExpressibleByStringInterpolation {
    init(stringInterpolation: StringInterpolation) {
        self.attributedString = NSAttributedString(attributedString: stringInterpolation.attributedString)
    }
    
    struct StringInterpolation: StringInterpolationProtocol {
        var attributedString: NSMutableAttributedString
        
        init(literalCapacity: Int, interpolationCount: Int) {
            self.attributedString = NSMutableAttributedString()
        }
        
        func appendLiteral(_ literal: String) {
            let astr = NSAttributedString(string: literal)
            self.attributedString.append(astr)
        }
        
        func appendInterpolation(_ string: String, attributes: [NSAttributedString.Key: Any]) {
            let astr = NSAttributedString(string: string, attributes: attributes)
            self.attributedString.append(astr)
        }
    }
}
