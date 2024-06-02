//
//  HorizScrollView.swift
//  CarrotMarket
//
//  Created by 김민솔 on 6/2/24.
//

import Foundation
import SwiftUI

struct HorizScrollView: View {
    @ObservedObject var horizItemList: HorizItemList

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("시원한 여름 간식의 계절🌈")
                    .font(.headline)
                Spacer()
                Button(action: {
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(horizItemList.items) { item in
                        VStack {
                            Image(item.image)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(8)
                            Text(item.title)
                                .font(.caption)
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                            Text(item.price)
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                        .frame(width: 100)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
