//
//  HorScrollListController.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/8.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  水平滚动列表视图

import UIKit
import MJRefresh

class HorScrollListController: BaseViewController
{
    
    // MARK: - Internal Property
    
    let type: HorScrollListType
    
    /// 作为多页时是否选中，默认为单页选中
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.firstLoadData()
            }
        }
    }
    
    // MARK: - Private Property
    fileprivate let tableView: UITableView = UITableView(frame: CGRect.zero, style: .plain)
    
    fileprivate var sourceList: [String] = []
    
    fileprivate var isFirstLoaded: Bool = true
    
    
    // MARK: - Initialize Function
    init(type: HorScrollListType) {
        self.type = type
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        //super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Internal Function
extension HorScrollListController {
    /// 第一次加载数据
    func firstLoadData() -> Void {
        if self.isFirstLoaded {
            self.isFirstLoaded = false
            self.tableView.mj_header.beginRefreshing()
        }
    }

}

// MARK: - LifeCircle Function
extension HorScrollListController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialUI()
        self.initialDataSource()
    }

}

// MARK: - UI
extension HorScrollListController {
    fileprivate func initialUI() -> Void {
        // 1. navigationbar
        // 2. tableView
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 250
        tableView.showsVerticalScrollIndicator = false
        tableView.mj_header = XDRefreshHeader(refreshingTarget: self, refreshingAction: #selector(headerRefresh))
        tableView.mj_footer = XDRefreshFooter(refreshingTarget: self, refreshingAction: #selector(footerLoadMore))
        tableView.mj_footer.isHidden = true
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}

// MARK: - Data(数据处理与加载)
extension HorScrollListController {
    // MARK: - Private  数据处理与加载
    fileprivate func initialDataSource() -> Void {
        //self.tableView.mj_header.beginRefreshing()
    }
    
    /// 数据源刷新
    fileprivate func refreshDataSource() -> Void {
        self.sourceList.removeAll()
        var list: [String] = []
        for i in 0...20 {
            list.append("JustTest \(i)")
        }
        self.sourceList = list
    }
    /// 数据源加载更多
    fileprivate func loadMoreDataSource() -> Void {
        var list: [String] = []
        for i in 0...20 {
            list.append("JustTest \(i)")
        }
        self.sourceList.append(contentsOf: list)
    }


}

// MARK: - Event(事件响应)
extension HorScrollListController {
    @objc fileprivate func headerRefresh() -> Void {
        self.refreshRequest()
    }
    @objc fileprivate func footerLoadMore() -> Void {
        self.loadMoreRequest()
    }

}

// MARK; - Request(网络请求)
extension HorScrollListController {
    /// 下拉刷新请求
    fileprivate func refreshRequest() -> Void {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.isHidden = false
            self.refreshDataSource()
            self.tableView.reloadData()
        }
    }
    /// 加载更多请求
    fileprivate func loadMoreRequest() -> Void {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            self.tableView.mj_footer.endRefreshing()
            self.loadMoreDataSource()
            self.tableView.reloadData()
        }
    }
    
}

// MARK: - Enter Page
extension HorScrollListController {
    
}

// MARK: - Notification
extension HorScrollListController {
    
}

// MARK: - Extension
extension HorScrollListController {
    
}

// MARK: - Delegate Function

// MARK: - <UITableViewDataSource>
extension HorScrollListController: UITableViewDataSource {
    
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
        cell?.contentView.backgroundColor = UIColor.random
        
        return cell!
    }
    
    
}

// MARK: - <UITableViewDelegate>
extension HorScrollListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return UITableView.automaticDimension
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt\(indexPath.row)")
    }
    
}

