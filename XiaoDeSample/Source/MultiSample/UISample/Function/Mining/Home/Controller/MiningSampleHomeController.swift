//
//  MiningSampleHomeController.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/10.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  挖矿示例主页

import UIKit

class MiningSampleHomeController: BaseViewController
{
    
    // MARK: - Internal Property
    // MARK: - Private Property
    fileprivate let tableView: UITableView = UITableView(frame: CGRect.zero, style: .plain)
    
    fileprivate var sourceList: [String] = []
    
    // MARK: - Initialize Function
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Internal Function

// MARK: - LifeCircle Function
extension MiningSampleHomeController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialUI()
        self.initialDataSource()
    }
}

// MARK: - UI
extension MiningSampleHomeController {
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // 1. navigationbar
        self.navigationItem.title = "MiningSample"
        // 2. tableView
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 250
        tableView.showsVerticalScrollIndicator = false
        //tableView.mj_header =
        //tableView.mj_footer =
        //tableView.mj_footer.isHidden = true
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - Data(数据处理与加载)
extension MiningSampleHomeController {
    // MARK: - Private  数据处理与加载
    fileprivate func initialDataSource() -> Void {
        self.sourceList = ["链优品", "链乎", "链聊", "存链", "科创商城"]
        self.tableView.reloadData()
    }

}

// MARK: - Event(事件响应)
extension MiningSampleHomeController {
    /// cell选中处理
    fileprivate func cellSelectedWith(model: String) -> Void {
        switch model {
        case "链优品":
            let nextVC = LYPMiningHomeController.init()
            self.enterPageVC(nextVC)
        case "链乎":
            let nextVC = IMeetMiningHomeController.init()
            self.enterPageVC(nextVC)
        case "链聊":
            let nextVC = AChatMiningHomeController.init()
            self.enterPageVC(nextVC)
        case "存链":
            let nextVC = SChainMiningHomeController.init()
            self.enterPageVC(nextVC)
        case "科创商城":
            let nextVC = SIMallMiningHomeController.init()
            self.enterPageVC(nextVC)
        default:
            break
        }
    }

}

// MARK; - Request(网络请求)
extension MiningSampleHomeController {
    
}

// MARK: - Enter Page
extension MiningSampleHomeController {
    
}

// MARK: - Notification
extension MiningSampleHomeController {
    
}

// MARK: - Extension
extension MiningSampleHomeController {
    
}

// MARK: - Delegate Function

// MARK: - <UITableViewDataSource>
extension MiningSampleHomeController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sourceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.sourceList[indexPath.row]
        let identifier = "CellIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if nil == cell {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        
        //cell?.preservesSuperviewLayoutMargins = false
        //cell?.layoutMargins = UIEdgeInsets.zero
        cell?.selectionStyle = .none
        cell?.textLabel?.text = model
        
        return cell!
    }
    
    
}

// MARK: - <UITableViewDelegate>
extension MiningSampleHomeController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return UITableView.automaticDimension
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt\(indexPath.row)")
        let model = self.sourceList[indexPath.row]
        self.cellSelectedWith(model: model)
    }
    
}

