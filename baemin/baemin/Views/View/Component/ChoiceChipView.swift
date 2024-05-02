//
//  ChoiceChipView.swift
//  baemin
//
//  Created by 김민솔 on 4/28/24.
//

import UIKit
import SnapKit
import Then

final class ChoiceChipView: UIView  {
    
    private let label = UILabel().then {
        $0.text = "선택"
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.textColor = .black
    }
    
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
    
    override func layoutSubviews() {
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
}
private extension ChoiceChipView {
    func setUI() {
        self.backgroundColor = .baemin2
    }
    func setHierarchy() {
        addSubview(label)
    }
    func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.width.equalTo(40)
        }
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
