//
//  PaySampleHomeController.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/10.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  支付范例主页

import UIKit

class PaySampleHomeController: BaseViewController
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
extension PaySampleHomeController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialUI()
        self.initialDataSource()
    }
}

// MARK: - UI
extension PaySampleHomeController {
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // 1. navigationbar
        self.navigationItem.title = "PaySample"
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
extension PaySampleHomeController {
    // MARK: - Private  数据处理与加载
    fileprivate func initialDataSource() -> Void {
        self.sourceList = ["PayPwdInputView", "PayPwdInput", "PayAnimation", "PayResult", "PayExperience"]
        self.tableView.reloadData()
    }

}

// MARK: - Event(事件响应)
extension PaySampleHomeController {
    /// cell选中处理
    fileprivate func cellSelectedWith(model: String) -> Void {
        switch model {
        case "PayPwdInputView":
            let nextVC = PayPwdInputViewShowController.init()
            self.enterPageVC(nextVC)
        case "PayPwdInput":
            let nextVC = PayPwdInputController.init()
            self.enterPageVC(nextVC)
        case "PayAnimation":
            let nextVC = PayAnimationController.init()
            self.enterPageVC(nextVC)
        case "PayResult":
            let nextVC = PayResultController.init()
            self.enterPageVC(nextVC)
        case "PayExperience":
            let nextVC = PayExperienceController.init()
            self.enterPageVC(nextVC)
        default:
            break
        }
    }

}

// MARK; - Request(网络请求)
extension PaySampleHomeController {
    
}

// MARK: - Enter Page
extension PaySampleHomeController {
    
}

// MARK: - Notification
extension PaySampleHomeController {
    
}

// MARK: - Extension
extension PaySampleHomeController {
    
}

// MARK: - Delegate Function

// MARK: - <UITableViewDataSource>
extension PaySampleHomeController: UITableViewDataSource {
    
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
extension PaySampleHomeController: UITableViewDelegate {
    
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

