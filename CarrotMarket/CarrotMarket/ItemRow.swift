//
//  ItemRow.swift
//  CarrotMarket
//
//  Created by 김민솔 on 6/2/24.
//

import Foundation
import SwiftUI

struct ItemRow: View {
    let item: SaleItem

    var body: some View {
        HStack {
            if let uiImage = item.image {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 90, height: 90)
                    .cornerRadius(8)
                    .padding(.trailing, 8)
            }
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                if let price = item.price {
                    Text(price)
                        .font(.subheadline)
                }
            }
        }
        .padding()
    }
}
