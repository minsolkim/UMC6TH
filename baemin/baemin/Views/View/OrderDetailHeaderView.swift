//
//  OrderDetailHeaderView.swift
//  baemin
//
//  Created by 김민솔 on 4/28/24.
//

import Foundation
import UIKit

final class OrderDetailHeaderView: UIView {
    
    private let menuImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let popularityMark = UIImageView().then {
        $0.image = UIImage(named: "popularityMark")
        $0.contentMode = .scaleAspectFit
    }
    
    private let menuNameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.lineBreakMode = .byCharWrapping
    }
    
    private let menuDetailLabel = UILabel().then {
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 14)
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }
    
    private let priceTitle = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 15)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.text = "가격"
    }
    
    private let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    private let seperateView = SeperatedView(height: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(menuImageName: UIImage?, menuName: String, menuDetail:String, menuPrice: Int) {
        self.menuImageView.image = UIImage(named: "MenuImage")
        self.menuNameLabel.text = menuName
        self.menuDetailLabel.text = menuDetail
        self.priceLabel.text = menuPrice.makePriceLabelFromNumber()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        menuImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.width*2.0/3.0)
        }
        
        popularityMark.snp.makeConstraints { make in
            make.top.equalTo(menuImageView.snp.bottom).offset(18)
            make.leading.equalToSuperview().inset(17)
            make.size.equalTo(30)
        }
        
        menuNameLabel.snp.makeConstraints { make in
            make.top.equalTo(popularityMark.snp.top)
            make.leading.equalTo(popularityMark.snp.trailing)
            make.trailing.equalToSuperview().inset(22)
        }
        
        menuDetailLabel.snp.makeConstraints { make in
            make.top.equalTo(menuNameLabel.snp.bottom).offset(15)
            make.leading.equalTo(popularityMark.snp.leading)
            make.trailing.equalToSuperview().inset(18)
        }
        
        priceTitle.snp.makeConstraints { make in
            make.top.equalTo(menuDetailLabel.snp.bottom).offset(49)
            make.leading.equalToSuperview().inset(17)
            make.height.equalTo(20)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(priceTitle.snp.top)
            make.trailing.equalToSuperview().inset(18)
            make.height.equalTo(20)
        }
        
        seperateView.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(18)
            make.leading.trailing.equalToSuperview()
        }
    }
    
}

private extension OrderDetailHeaderView {
    func setUI() {
        backgroundColor = .white
    }
    
    func setHierarchy() {
        addSubviews(menuImageView, popularityMark, menuNameLabel, menuDetailLabel, priceTitle, priceLabel, seperateView)
    }
}
