//
//  AddMenuTableViewCell.swift
//  baemin
//
//  Created by 김민솔 on 5/2/24.
//

import UIKit
import SnapKit
import Then

protocol priceDelegate: AnyObject {
    func priceChangeBySubMenu(isSelect: Bool, price: Int)
}

final class AddMenuTableViewCell: UITableViewCell, TableViewCellReuseProtocol {
    
    weak var delegate : priceDelegate?
    
    var data: Menu? {
        didSet {
            guard let data else { return }
            addMenuLabel.text = data.addMenuName
            priceLabel.text = "+" + data.addMenuPrice.makePriceLabelFromNumber()
            price = data.addMenuPrice
        }
    }
    private var price: Int = 0
    
    private let checkBox = UIButton().then {
        $0.setImage(UIImage(named: "checkBoxFalse"), for: .normal)
    }
    
    private let addMenuLabel = UILabel().then {
        $0.text = "새우 튀김 6p 추가"
        $0.font = UIFont.systemFont(ofSize: 13)
        $0.textColor = .black
    }
    
    private let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .black
        $0.text = "+13,000원"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
}

private extension AddMenuTableViewCell {
    func setUI() {
        backgroundColor = .white
    }
    
    func setHierarchy() {
        contentView.addSubviews(checkBox, addMenuLabel, priceLabel)
    }
    
    func setLayout() {
        checkBox.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(24)
            make.size.equalTo(24)
        }
        
        addMenuLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(checkBox.snp.trailing).offset(13)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(24)
        }
    }
    
    func setAddTarget() {
        checkBox.addButtonAction { sender in
            sender.isSelected = !sender.isSelected
            sender.isSelected ? self.checkBox.setImage(UIImage(named: "checkBoxTrue"), for: .normal) :
            self.checkBox.setImage(UIImage(named: "checkBoxFalse"), for: .normal)
            self.delegate?.priceChangeBySubMenu(isSelect: sender.isSelected, price: self.price)
        }
    }
    
    func setDelegate() {
        
    }
}

