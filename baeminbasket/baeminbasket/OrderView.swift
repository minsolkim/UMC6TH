//
//  OrderView.swift
//  baeminbasket
//
//  Created by 김민솔 on 6/25/24.
//
import SwiftUI

struct OrderView: View {
    @State var selectedSize: String
    @State var isGoldCrust: Bool
    @State var quantity: Int = 1
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("pizza")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .clipped()
                
                VStack(alignment: .leading) {
                    Text("[재주문1위] 바싹불고기피자")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.bottom, 2)
                    
                    Text("가격: \(selectedSize) (\(selectedSize == "M" ? "20,000원" : "23,000원"))")
                        .font(.body)
                    
                    Text("도우변경: \(isGoldCrust ? "크림리치골드 크러스트 (4,500원)" : "기본 크러스트")")
                        .font(.body)
                }
                Spacer()
                Button(action: {
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                }
            }
            .padding()

            Text("\(calculateTotalPrice() * quantity)원")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            HStack {
                Button(action: {
                }) {
                    Text("옵션변경")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.mint.opacity(0.2))
                        .cornerRadius(10)
                }
                
                HStack {
                    Button(action: {
                        if quantity > 1 {
                            quantity -= 1
                        }
                    }) {
                        Text("-")
                            .font(.headline)
                            .padding()
                            .frame(width: 40, height: 40)
                            .background(Color.mint.opacity(0.2))
                            .cornerRadius(10)
                    }
                    
                    Text("\(quantity)")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    Button(action: {
                        quantity += 1
                    }) {
                        Text("+")
                            .font(.headline)
                            .padding()
                            .frame(width: 40, height: 40)
                            .background(Color.mint.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle("주문 요약")
    }
    
    func calculateTotalPrice() -> Int {
        let basePrice = selectedSize == "M" ? 20000 : 23000
        let crustPrice = isGoldCrust ? 4500 : 0
        return basePrice + crustPrice
    }
}

#Preview {
    OrderView(selectedSize: "M", isGoldCrust: false)
}
