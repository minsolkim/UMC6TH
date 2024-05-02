//
//  PriceInfoView.swift
//  baemin
//
//  Created by 김민솔 on 4/30/24.
//

import Foundation
import UIKit
import SnapKit
import Then

final class PriceInfoView: UIView {
    var price: Int? {
        didSet {
            guard let price else { return }
            self.addCartButton.price = price
        }
    }
    private let minimumPriceForDelivery: Int
    
    private let seperatedView = SeperatedView(height: 1)
    let addCartButton = BasicButton(price: 0)
    private let minimunPriceDeliveryLable = UILabel().then{
        $0.text = "배달최소주문금액"
        $0.textColor = .gray
        $0.font = UIFont.systemFont(ofSize: 13)
    }
    private let minimumPrice = UILabel().then {
        $0.text = "17,000원"
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = .black
    }
    
    init(minimumPriceForDelivery: Int) {
        self.minimumPriceForDelivery = minimumPriceForDelivery
        super.init(frame: .zero)
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
        
        // MARK: - autolayout설정
        setLayout()
        
        // MARK: - button의 addtarget설정
        setAddTarget()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
private extension PriceInfoView {
    func setUI() {
        backgroundColor = .white
        minimumPrice.text = minimumPriceForDelivery.makePriceLabelFromNumber()
    }
    
    func setHierarchy() {
        addSubviews(seperatedView, minimunPriceDeliveryLable, minimumPrice, addCartButton)
    }
    
    func setLayout() {
        seperatedView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        minimunPriceDeliveryLable.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(18)
            make.leading.equalToSuperview().inset(14)
        }
        
        minimumPrice.snp.makeConstraints { make in
            make.top.equalTo(minimunPriceDeliveryLable.snp.bottom)
            make.leading.equalToSuperview().inset(14)
        }
        
        addCartButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
            make.leading.equalTo(minimunPriceDeliveryLable.snp.trailing).offset(19)
        }
    }
    
    func setAddTarget() {
        
    }
}


