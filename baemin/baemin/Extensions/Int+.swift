//
//  Int+.swift
//  baemin
//
//  Created by 김민솔 on 5/2/24.
//

import Foundation

extension Int {
    public func makePriceLabelFromNumber() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self))! + "원"
    }
}
