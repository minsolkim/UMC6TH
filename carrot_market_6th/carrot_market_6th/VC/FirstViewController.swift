//
//  FirstViewController.swift
//  carrot_market_6th
//
//  Created by 김민솔 on 4/7/24.
//

import UIKit
import SnapKit
import Then

class FirstViewController: UIViewController {
    let itemList = ItemList()
    
    private let tableView = UITableView().then {
        $0.allowsSelection = false
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = true
        $0.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        $0.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.id)
        //$0.register(MyTableViewCellTwo.self, forCellReuseIdentifier: MyTableViewCellTwo.id)
    }
    
    private let floatingButton =  UIButton().then {
        $0.backgroundColor = .systemOrange
        $0.tintColor = .white
        $0.setTitle("+글쓰기", for: .normal) // 버튼의 타이틀 설정
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 25 // 모서리를 둥글게 하는 정도 조절
        $0.clipsToBounds = true
        $0.layer.shadowRadius = 10
        $0.layer.shadowOpacity = 0.3
        $0.isHidden = false
        $0.addTarget(self, action: #selector(floatingButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationController()
        setTableView()
        addSubviews()
        setConfig()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(floatingButton)
        view.bringSubviewToFront(floatingButton)
        floatingButton.isHidden = false
        floatingButton.addTarget(self, action: #selector(floatingButtonTapped), for: .touchUpInside)
    }
    private func setConfig() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        floatingButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.width.equalTo(100)
            $0.height.equalTo(57)
        }
    }
    private func setNavigationController() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let titleLabel = UILabel()
        titleLabel.text = "내 위치"
        titleLabel.textColor = .black
        titleLabel.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        
        let image1 = UIImage(named: "bell")?.resizeImage(targetSize: CGSize(width: 25, height: 25))
        let image2 = UIImage(named: "loupe")?.resizeImage(targetSize: CGSize(width: 25, height: 25))
        let image3 = UIImage(named: "more")?.resizeImage(targetSize: CGSize(width: 25, height: 25))
        // 이미지의 렌더링 모드를 .alwaysOriginal로 설정합니다.
        let button1 = UIBarButtonItem(image: image1?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(button1Tapped))
        let button2 = UIBarButtonItem(image: image2?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(button2Tapped))
        let button3 = UIBarButtonItem(image: image3?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(button3Tapped))
        
        // 간격을 설정할 UIBarButtonItem을 생성합니다.
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        flexibleSpace.width = 5.0 // 간격 너비 조정
        
        // 오른쪽 버튼들과 간격을 배열로 설정합니다.
        navigationItem.rightBarButtonItems = [button1, flexibleSpace, button2, flexibleSpace, button3]
    }
    private func setTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    // 플로팅 버튼을 눌렀을 때 실행될 액션
    @objc func floatingButtonTapped() {
        // 버튼이 눌렸을 때 수행할 동작을 여기에 추가합니다.
        print("Floating button tapped!")
    }
    
    
}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.id, for: indexPath) as! HomeTableViewCell
        
        let item = itemList.items[indexPath.row]
        
        cell.titleLabel.text = item.title
        cell.descriptionLabel.text = item.description
        cell.priceLabel.text = item.price
        cell.dateLabel.text = item.date
        cell.chatNumberLabel.text = item.chatNumber
        cell.heartNumberLabel.text = item.heartNumber
        cell.thumbnailImageView.image = item.image
        
        return cell
    }
    
    //MARK: -- Action
    @objc func button1Tapped() {
        // 첫 번째 버튼이 탭되었을 때 실행되는 코드
        print("Button 1 tapped")
    }
    
    @objc func button2Tapped() {
        // 두 번째 버튼이 탭되었을 때 실행되는 코드
        print("Button 2 tapped")
    }
    
    @objc func button3Tapped() {
        // 세 번째 버튼이 탭되었을 때 실행되는 코드
        print("Button 3 tapped")
    }
}
extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}
