//
//  SeperatedView.swift
//  baemin
//
//  Created by 김민솔 on 4/28/24.
//

import UIKit
import SnapKit
import Then

final class SeperatedView: UIView {
    init(height: CGFloat) {
        super.init(frame: .zero)
        self.backgroundColor = .baemin2
        self.snp.makeConstraints { make in
            make.height.equalTo(height)
        }
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
