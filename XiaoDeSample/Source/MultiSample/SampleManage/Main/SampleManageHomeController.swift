//
//  SampleManageHomeController.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/6/4.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  Sample管理主页

import UIKit

class SampleManageHomeController: BaseViewController
{
    
    // MARK: - Internal Property
    // MARK: - Private Property
    fileprivate let tableView: UITableView = UITableView(frame: CGRect.zero, style: .plain)
    
    fileprivate var sourceList: [String] = ["RxSwift", "SwiftUI", "LeftMenuRightMenu"]
    
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
extension SampleManageHomeController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialUI()
        self.initialDataSource()
    }
}

// MARK: - UI
extension SampleManageHomeController {
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // 1. navigationbar
        self.navigationItem.title = "SampleManage"
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
extension SampleManageHomeController {
    // MARK: - Private  数据处理与加载
    fileprivate func initialDataSource() -> Void {
        
    }
}

// MARK: - Event(事件响应)
extension SampleManageHomeController {
    
}

// MARK; - Request(网络请求)
extension SampleManageHomeController {
    
}

// MARK: - Enter Page
extension SampleManageHomeController {
    fileprivate func cellSelectedProcess(with model: String) -> Void {
        switch model {
        case "RxSwift":
            self.enterRxSwiftSample()
        case "SwiftUI":
            self.enterSwiftUISample()
        case "LeftMenuRightMenu":
            self.enterLeftMenuRightMenuSample()
        default:
            break
        }
    }
    fileprivate func enterRxSwiftSample() -> Void {
        let model = SampleItemModel.init(type: .rxsiwft, mainVC: RxSwiftSampleMainController.init())
        SampleManager.share.swithSample(model)
    }
    fileprivate func enterSwiftUISample() -> Void {
        let model = SampleItemModel.init(type: .swiftui, mainVC: SwiftUISampleMainController.init())
        SampleManager.share.swithSample(model)
    }
    fileprivate func enterLeftMenuRightMenuSample() -> Void {
        let model = SampleItemModel.init(type: .lrmenu, mainVC: LRMenuSampleMainController.init())
        SampleManager.share.swithSample(model)
    }
    
}

// MARK: - Notification
extension SampleManageHomeController {
    
}

// MARK: - Extension
extension SampleManageHomeController {
    
}

// MARK: - Delegate Function

// MARK: - <UITableViewDataSource>
extension SampleManageHomeController: UITableViewDataSource {
    
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
extension SampleManageHomeController: UITableViewDelegate {
    
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

