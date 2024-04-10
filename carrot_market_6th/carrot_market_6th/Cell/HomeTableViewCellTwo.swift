//
//  HomeTableViewCellTwo.swift
//  carrot_market_6th
//
//  Created by 김민솔 on 4/8/24.
//

import UIKit
import Then
import SnapKit

class HomeTableViewCellTwo: UITableViewCell {
    static let id = "HomeTableViewCellTwo"
    private let label = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.numberOfLines = 0
        $0.textColor = .black
    }
    private let button = UIButton().then {
        $0.tintColor = .black
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    }
    lazy var collectionView = UICollectionView().then {
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
