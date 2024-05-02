//
//  OrderDetailFooterView.swift
//  baemin
//
//  Created by 김민솔 on 4/28/24.
//

import Foundation
import UIKit

final class OrderDetailFooterView: UIView {
    private let seperatedView = SeperatedView(height: 1.5)
    
    private let label = UILabel().then {
        $0.text = "수량"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15)
    }
    
    let stepperView = MenuStepperView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
        
        // MARK: - autolayout설정
        setLayout()
        
        // MARK: - button의 addtarget설정
        setAddTarget()
        
        // MARK: - delegate설정
        setDelegate()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension OrderDetailFooterView {
    func setUI() {
        backgroundColor = .white
        addSubviews(seperatedView, label, stepperView)
    }
    
    func setHierarchy() {
        
        seperatedView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(25)
        }
        
        stepperView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(22)
            make.width.equalTo(156)
            make.height.equalTo(50)
        }
    }
    
    func setLayout() {
        
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        
    }
}
