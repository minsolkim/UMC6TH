//
//  MenuStepperView.swift
//  baemin
//
//  Created by 김민솔 on 4/28/24.
//

import UIKit
import SnapKit
import Then

protocol menuCountDelegate: AnyObject {
    func priceChangeByMenuCount(menuCount: Int)
}

final class MenuStepperView: UIView {
    
    weak var delegate: menuCountDelegate?
    
    private var menuCount: Int = 1 {
        didSet {
            menuCountLabel.text = menuCount.description + "개"
            self.delegate?.priceChangeByMenuCount(menuCount: menuCount)
        }
    }
    
    private let appendButton = UIButton().then {
        $0.setImage(UIImage(named: "plus"), for: .normal)
    }
    
    private let reduceButton = UIButton().then {
        $0.setImage(UIImage(named: "minus"), for: .normal)
    }
    
    private lazy var menuCountLabel: UILabel = {
        let label = UILabel()
        label.text = menuCount.description + "개"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
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
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension MenuStepperView {
    func setUI() {
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
    }
    
    func setHierarchy() {
        addSubviews(reduceButton, menuCountLabel, appendButton)
    }
    
    func setLayout() {
        reduceButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
            make.size.equalTo(28)
        }
        
        menuCountLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(reduceButton.snp.trailing).offset(28)
        }
        
        appendButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
            make.leading.equalTo(menuCountLabel.snp.trailing).offset(28)
        }
    }
    
    func setAddTarget() {
        appendButton.addButtonAction { sender in
            self.menuCount += 1
        }
        
        reduceButton.addButtonAction { sender in
            if self.menuCount >= 2 {
                self.menuCount -= 1
            }
        }
    }
}
