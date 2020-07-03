//
//  UISFunctionHomeController.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/3.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//

import UIKit

typealias UISampleFunctionHomeController = UISFunctionHomeController
class UISFunctionHomeController: BaseViewController
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
extension UISFunctionHomeController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialUI()
        self.initialDataSource()
    }
}

// MARK: - UI
extension UISFunctionHomeController {
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // 1. navigationbar
        self.navigationItem.title = "Common"
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
extension UISFunctionHomeController {
    // MARK: - Private  数据处理与加载
    fileprivate func initialDataSource() -> Void {
        
    }
}

// MARK: - Event(事件响应)
extension UISFunctionHomeController {
    
}

// MARK; - Request(网络请求)
extension UISFunctionHomeController {
    
}

// MARK: - Enter Page
extension UISFunctionHomeController {
    
}

// MARK: - Notification
extension UISFunctionHomeController {
    
}

// MARK: - Extension
extension UISFunctionHomeController {
    
}

// MARK: - Delegate Function

// MARK: - <UITableViewDataSource>
extension UISFunctionHomeController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "CellIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if nil == cell {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        
        //cell?.preservesSuperviewLayoutMargins = false
        //cell?.layoutMargins = UIEdgeInsets.zero
        //cell?.selectionStyle = .none
        cell?.textLabel?.text = "Just Test"
        
        return cell!
    }
    
    
}

// MARK: - <UITableViewDelegate>
extension UISFunctionHomeController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return UITableView.automaticDimension
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt\(indexPath.row)")
    }
    
}

