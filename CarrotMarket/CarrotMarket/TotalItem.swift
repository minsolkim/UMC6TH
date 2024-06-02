//
//  TotalItem.swift
//  CarrotMarket
//
//  Created by 김민솔 on 6/2/24.
//

import Foundation

enum TotalItem: Identifiable {
    case item(SaleItem)
    case horizItem(HorizItem)

    var id: UUID {
        switch self {
        case .item(let item):
            return item.id
        case .horizItem(let horizItem):
            return horizItem.id
        }
    }
}
