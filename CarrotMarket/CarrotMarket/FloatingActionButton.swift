//
//  FloatingActionButton.swift
//  CarrotMarket
//
//  Created by 김민솔 on 6/2/24.
//

import Foundation
import SwiftUI

struct FloatingActionButton: View {
    var body: some View {
        Button(action: {
            // Action when button is tapped
            print("Floating button tapped")
        }) {
            Text("+글쓰기")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .padding()
                .background(Color.orange)
                .cornerRadius(25)
                .shadow(radius: 10, x: 0, y: 10)
        }
        .padding()
    }
}
