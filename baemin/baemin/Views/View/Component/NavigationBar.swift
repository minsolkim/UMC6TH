//
//  NavigationBar.swift
//  baemin
//
//  Created by 김민솔 on 4/28/24.
//

import Foundation
import UIKit
import SnapKit
import Then


final class NavigationBar: UIView {
    private let backButton = UIButton().then {
        $0.setImage(UIImage.init(named: "ic_back"), for: .normal)
        $0.tintColor = .white
    }
    
    private let homeButton = UIButton().then {
        $0.setImage(UIImage.init(named: "ic_home"), for: .normal)
        $0.tintColor = .white
    }
    
    var menuName = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .black
        $0.isHidden = true
    }
    
    private let shareButton = UIButton().then {
        $0.setImage(UIImage.init(named: "ic_share"), for: .normal)
        $0.tintColor = .white
    }
    
    private let goCartButton = UIButton().then {
        $0.setImage(UIImage.init(named: "ic_shopping"), for: .normal)
        $0.tintColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //MARK: -- 컴포넌트 설정
        setUI()
        
        //MARK: -- addSubView
        setHierarchy()
        
        //MARK: -- autolayout 설정
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    func config(menuName: String) {
        self.menuName.text = menuName
    }
}

private extension NavigationBar {
    func setUI() {
        
    }
    
    func setHierarchy() {
        addSubviews(backButton,homeButton,shareButton,goCartButton)
    }
    
    func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(97)
        }
        backButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(55)
            make.leading.equalToSuperview().inset(8)
            make.size.equalTo(28)
        }
        
        goCartButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(55)
            make.trailing.equalToSuperview().inset(8)
            make.size.equalTo(28)
        }
        
        shareButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(55)
            make.trailing.equalTo(goCartButton.snp.leading).offset(-14)
            make.size.equalTo(28)
        }
        
        homeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(55)
            make.trailing.equalTo(shareButton.snp.leading).offset(-14)
            make.size.equalTo(28)
        }
        
        
    }
}

