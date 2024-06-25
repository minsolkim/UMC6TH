//
//  SelectView.swift
//  baki_week8
//
//  Created by 박희민 on 6/3/24.
//

// SelectView.swift

import SwiftUI

struct SelectView: View {
    @Binding var selectedSize: String
    @Binding var isGoldCrust: Bool
    
    let sizes = ["M", "L"]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("[재주문1위] 바싹불고기피자")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("바싹 익힌 불고기의 풍미를 입안 가득 느낄 수 있는 자가제빵선명희피자의 야심작")
                .font(.body)
                .padding(.bottom)
            
            Section(header:
                        HStack {
                Text("가격")
                    .font(.headline)
                Spacer()
                Text("필수")
                    .font(.footnote)
                    .foregroundColor(.blue)
            }
                .padding(.top)
            ) {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(sizes, id: \.self) { size in
                        HStack {
                            Image(systemName: selectedSize == size ? "largecircle.fill.circle" : "circle")
                                .foregroundColor(selectedSize == size ? .mint : .gray)
                            Text(size)
                                .onTapGesture {
                                    selectedSize = size
                                }
                            Spacer()
                            Text(size == "M" ? "20,000원" : "23,000원")
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
            .padding(.vertical)
            
            
            
            // 도우 변경 섹션
            Section(header:
                        HStack {
                Text("도우변경")
                    .font(.headline)
                Spacer()
                Text("선택")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
                .padding(.top)
            ) {
                Button(action: {
                    isGoldCrust.toggle()
                }) {
                    HStack {
                        Image(systemName: isGoldCrust ? "checkmark.square.fill" : "square")
                            .foregroundColor(isGoldCrust ? .mint : .gray)
                        Text("크림리치골드 크러스트 +4,500원")
                            .foregroundColor(.primary)// 눌려도 색깔 안 바뀌게
                    }
                    .padding(.vertical)
                }
            }
        }
        .padding()
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    SelectView(selectedSize: .constant("M"), isGoldCrust: .constant(false))
}
