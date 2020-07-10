//
//  HorScrollHomeController.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/8.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  水平滚动主页

import UIKit

typealias HorScrollSampleHomeController = HorScrollHomeController
class HorScrollHomeController: BaseViewController
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
extension HorScrollHomeController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialUI()
        self.initialDataSource()
    }
}

// MARK: - UI
extension HorScrollHomeController {
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // 1. navigationbar
        self.navigationItem.title = "HorScrollSample"
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
extension HorScrollHomeController {
    // MARK: - Private  数据处理与加载
    fileprivate func initialDataSource() -> Void {
        self.sourceList = ["HorScroll1", "HorScroll2", "HorScroll3", "HorScroll4", "HorScroll5", "HorScroll6", "MyTask", "MyOrder"]
        self.tableView.reloadData()
    }

}

// MARK: - Event(事件响应)
extension HorScrollHomeController {
    /// cell选中处理
    fileprivate func cellSelectedWith(model: String) -> Void {
        switch model {
        case "HorScroll1":
            let nextVC = HorScroll1Controller.init()
            self.enterPageVC(nextVC)
        case "HorScroll2":
            let nextVC = HorScroll2Controller.init()
            self.enterPageVC(nextVC)
        case "HorScroll3":
            let nextVC = HorScroll3Controller.init()
            self.enterPageVC(nextVC)
        case "HorScroll4":
            let nextVC = HorScroll4Controller.init()
            self.enterPageVC(nextVC)
        case "HorScroll5":
            let nextVC = HorScroll5Controller.init()
            self.enterPageVC(nextVC)
        case "HorScroll6":
            let nextVC = HorScroll6Controller.init()
            self.enterPageVC(nextVC)
        case "MyTask":
            let nextVC = HorScrollMyTaskController.init()
            self.enterPageVC(nextVC)
        case "MyOrder":
            let nextVC = HorScrollMyOrderController.init()
            self.enterPageVC(nextVC)
        default:
            break
        }
    }

}

// MARK; - Request(网络请求)
extension HorScrollHomeController {
    
}

// MARK: - Enter Page
extension HorScrollHomeController {
    
}

// MARK: - Notification
extension HorScrollHomeController {
    
}

// MARK: - Extension
extension HorScrollHomeController {
    
}

// MARK: - Delegate Function

// MARK: - <UITableViewDataSource>
extension HorScrollHomeController: UITableViewDataSource {
    
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
extension HorScrollHomeController: UITableViewDelegate {
    
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

