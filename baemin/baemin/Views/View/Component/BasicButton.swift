//
//  BasicButton.swift
//  baemin
//
//  Created by 김민솔 on 4/30/24.
//

import Foundation
import SnapKit
import Then
import UIKit

final class BasicButton: UIButton {
    var price: Int? {
        didSet {
            guard let price else { return }
            self.setTitle(price.makePriceLabelFromNumber() + " 담기", for: .normal)
        }
    }
    init(price: Int) {
        super.init(frame: .zero)
        self.setTitle(price.makePriceLabelFromNumber() + " 담기", for: .normal)
        self.titleLabel?.font = .boldSystemFont(ofSize: 15)
        self.backgroundColor = .baemin
        self.layer.cornerRadius = 3.36
        self.snp.makeConstraints { make in
            make.height.equalTo(45)
        }
    }
    init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 15)
        self.backgroundColor = .green
        self.layer.cornerRadius = 3.36
        self.snp.makeConstraints { make in
            make.height.equalTo(45)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
