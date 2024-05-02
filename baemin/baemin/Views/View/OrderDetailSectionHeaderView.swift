//
//  OrderDetailSectionHeaderView.swift
//  baemin
//
//  Created by 김민솔 on 4/28/24.
//

import Foundation
import UIKit

final class OrderDetailSectionHeaderView: UIView {
    
    private let title = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 15)
        $0.textColor = .black
    }
    
    private let maximumLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .gray
    }
    
    private let choiceLabel = ChoiceChipView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
        
        // MARK: - autolayout설정
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(title: String, maxCount: Int) {
        self.title.text = title
        self.maximumLabel.text = "최대 \(maxCount)개 선택"
    }
}

private extension OrderDetailSectionHeaderView {
    func setUI() {
        backgroundColor = .white
    }
    
    func setHierarchy() {
        addSubviews(title, maximumLabel, choiceLabel)
    }
    
    func setLayout() {
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.leading.equalToSuperview().inset(20)
        }
        maximumLabel.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(20)
        }
        
        choiceLabel.snp.makeConstraints { make in
            make.centerY.equalTo(title.snp.centerY)
            make.trailing.equalToSuperview().inset(25)
        }
    }
}
