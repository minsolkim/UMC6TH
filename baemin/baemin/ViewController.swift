//
//  ViewController.swift
//  baemin
//
//  Created by 김민솔 on 4/2/24.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    private var singleMenuPrice = 0 {
        didSet {
            priceInfoView.price = totalMenuCount > 1 ? singleMenuPrice * totalMenuCount : singleMenuPrice
        }
    }
    
    private lazy var totalMenuCount = 1 {
        didSet {
            priceInfoView.price = singleMenuPrice * totalMenuCount
        }
    }
    
    private let navigationBar = NavigationBar()
    private let navigationBarBackGroundView = UIView()
    private let mockData = OrderDetail.orderDetailDummy
    private let OrderDetailTableView = UITableView(frame: .zero, style: .grouped)
    private lazy var priceInfoView = PriceInfoView(minimumPriceForDelivery: mockData.minPriceForDelivery)
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        setTableView()
        setData()
    }


}

private extension ViewController {
    func setUI() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationBarBackGroundView.backgroundColor = .white
        self.navigationBarBackGroundView.layer.opacity = 0
        
    }
    
    func setHierarchy() {
        view.addSubviews(OrderDetailTableView,navigationBarBackGroundView,navigationBar,priceInfoView)
    }
    
    func setLayout() {
        navigationBarBackGroundView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(navigationBar.snp.bottom)
        }
        
        navigationBar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        OrderDetailTableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(priceInfoView.snp.top)
        }
        priceInfoView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(90)
        }
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        OrderDetailTableView.dataSource = self
        OrderDetailTableView.delegate = self
    }
    
    func setTableView() {
        OrderDetailTableView.separatorStyle = .none
        OrderDetailTableView.sectionFooterHeight = 0
        AddMenuTableViewCell.register(tableView: OrderDetailTableView)
        let headerView = OrderDetailHeaderView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 518))
        headerView.config(menuImageName: mockData.menuImage, menuName: mockData.menuName, menuDetail: mockData.menuDetail, menuPrice: mockData.menuPrice)
        OrderDetailTableView.tableHeaderView = headerView
        OrderDetailTableView.contentInsetAdjustmentBehavior = .never
        let footerView = OrderDetailFooterView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80))
        footerView.stepperView.delegate = self
        OrderDetailTableView.tableFooterView = footerView
    }
    
    func setData() {
        self.navigationBar.config(menuName: mockData.menuName)
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return mockData.addOrder.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockData.addOrder[section].addMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AddMenuTableViewCell.dequeueReusableCell(tableView: tableView)
        cell.delegate = self
        cell.selectionStyle = .none
        cell.data = mockData.addOrder[indexPath.section].addMenu[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = OrderDetailSectionHeaderView()
        sectionHeaderView.config(title: mockData.addOrder[section].addMenuName, maxCount: mockData.addOrder[section].addMenu.count)
        return sectionHeaderView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 76
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y <= 260 {
            self.navigationBar.layer.opacity = Float((-1.0/80.0)*(scrollView.contentOffset.y)+(13.0/4.0))
            self.navigationBar.menuName.isHidden = true
//            self.navigationBar.buttonTintColor =
            self.navigationBarBackGroundView.layer.opacity = 0
            self.navigationController?.navigationBar.barStyle = .black
        } else {
            self.navigationBar.menuName.isHidden = false
//            self.navigationBar.buttonTintColor = .designSystem(.black)
            self.navigationBar.layer.opacity = Float((1/20)*(scrollView.contentOffset.y)-13)
            self.navigationBarBackGroundView.layer.opacity = Float((1/40)*(scrollView.contentOffset.y)-6)
            self.navigationController?.navigationBar.barStyle = .default
        }
    }
}

extension ViewController: priceDelegate {
    func priceChangeBySubMenu(isSelect: Bool, price: Int) {
        isSelect ? (singleMenuPrice += price) : (singleMenuPrice -= price)
    }
}

extension ViewController: menuCountDelegate {
    func priceChangeByMenuCount(menuCount: Int) {
        self.totalMenuCount = menuCount
    }
}
