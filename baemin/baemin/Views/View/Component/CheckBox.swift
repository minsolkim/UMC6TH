//
//  CheckBox.swift
//  baemin
//
//  Created by 김민솔 on 4/28/24.
//

import Foundation
import UIKit

import SnapKit
import Then

final class CheckBox: UIControl {
    var dataSender: ((Bool)->Void)?
    
    private let checkImageView = UIImageView().then {
        $0.image = UIImage(named: "checkBoxFalse")
    }
    
    private var checked: Bool = false {
        didSet {
            checkImageView.image = checked ? UIImage(named: "checkBoxTrue")!: UIImage(named: "checkBoxFalse")!
            guard let dataSender else { return }
            dataSender(checked)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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

private extension CheckBox {
    
    func setHierarchy() {
        addSubviews(checkImageView)
    }
    
    func setLayout() {
        checkImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setAddTarget() {
        addButtonAction { _ in
            self.checked.toggle()
        }
    }
    
    func setDelegate() {
        
    }
}
