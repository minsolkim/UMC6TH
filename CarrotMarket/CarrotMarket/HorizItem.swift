//
//  HorizItem.swift
//  CarrotMarket
//
//  Created by 김민솔 on 6/2/24.
//

import Foundation
import SwiftUI

struct HorizItem: Identifiable {
    let id = UUID()
    let image: String 
    let title: String
    let price: String
}

class HorizItemList: ObservableObject {
    @Published var items: [HorizItem] = [
        HorizItem(image: "image1", title: "키친플라워 DW1201CP", price: "62,000원"),
        HorizItem(image: "image2", title: "얼음 트레이 소 (얼음판)/개당 판매", price: "1,000원"),
        HorizItem(image: "image3", title: "실리콘 얼음틀", price: "2,000원"),
        HorizItem(image: "image4", title: "밥바바", price: "5,000원")
    ]
}
