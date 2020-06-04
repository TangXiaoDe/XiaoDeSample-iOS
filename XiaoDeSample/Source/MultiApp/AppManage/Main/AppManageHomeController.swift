//
//  AppManageHomeController.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/6/2.
//  Copyright © 2020 XiaoDe. All rights reserved.
//
//  项目管理主页

import UIKit

class AppManageHomeController: BaseViewController
{
    
    // MARK: - Internal Property
    // MARK: - Private Property
    fileprivate let tableView: UITableView = UITableView(frame: CGRect.zero, style: .plain)
    
    fileprivate var sourceList: [String] = ["XDBrowser", "XDContacts", "XDProjectManage"]
    
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
extension AppManageHomeController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialUI()
        self.initialDataSource()
    }
}

// MARK: - UI
extension AppManageHomeController {
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // 1. navigationbar
        self.navigationItem.title = "ManageHome"  // "应用管理"
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
extension AppManageHomeController {
    // MARK: - Private  数据处理与加载
    fileprivate func initialDataSource() -> Void {
        
    }
}

// MARK: - Event(事件响应)
extension AppManageHomeController {
    
}

// MARK; - Request(网络请求)
extension AppManageHomeController {
    
}

// MARK: - Enter Page
extension AppManageHomeController {
    fileprivate func cellSelectedProcess(with model: String) -> Void {
        switch model {
        case "XDBrowser":
            self.enterXDBrowser()
        case "XDContacts":
            self.enterXDContacts()
        case "XDProjectManage":
            self.enterXDProjectManage()
        default:
            break
        }
    }
    fileprivate func enterXDBrowser() -> Void {
        let model = AppItemModel.init(type: .xdbrowser, mainVC: XDBrowserMainController.init())
        AppManager.share.swithApp(model)
    }
    fileprivate func enterXDContacts() -> Void {
        
    }
    fileprivate func enterXDProjectManage() -> Void {
        let model = AppItemModel.init(type: .projectmanage, mainVC: XDProjectManageMainController.init())
        AppManager.share.swithApp(model)
    }
    
    
    
}

// MARK: - Notification
extension AppManageHomeController {
    
}

// MARK: - Extension
extension AppManageHomeController {
    
}

// MARK: - Delegate Function

// MARK: - <UITableViewDataSource>
extension AppManageHomeController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sourceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "CellIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if nil == cell {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        
        let model = self.sourceList[indexPath.row]
        //cell?.preservesSuperviewLayoutMargins = false
        //cell?.layoutMargins = UIEdgeInsets.zero
        //cell?.selectionStyle = .none
        cell?.textLabel?.text = model
        
        return cell!
    }
    
    
}

// MARK: - <UITableViewDelegate>
extension AppManageHomeController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return UITableView.automaticDimension
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt\(indexPath.row)")
        
        let model = self.sourceList[indexPath.row]
        self.cellSelectedProcess(with: model)
    }
    
}

