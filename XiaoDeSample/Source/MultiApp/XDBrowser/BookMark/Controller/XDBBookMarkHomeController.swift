//
//  XDBBookMarkHomeController.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/6/3.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//

import UIKit

class XDBBookMarkHomeController: BaseViewController
{
    
    // MARK: - Internal Property
    // MARK: - Private Property
    fileprivate let tableView: UITableView = UITableView(frame: CGRect.zero, style: .plain)
    
    fileprivate var sourceList: [XDBBookMarkModel] = []
    
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
extension XDBBookMarkHomeController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialUI()
        self.initialDataSource()
    }
}

// MARK: - UI
extension XDBBookMarkHomeController {
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // 1. navigationbar
        self.navigationItem.title = "书签"
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
extension XDBBookMarkHomeController {
    // MARK: - Private  数据处理与加载
    fileprivate func initialDataSource() -> Void {
        let bk1 = XDBBookMarkModel.init(title: "iOS端IM开发从入门到填坑", domain: "https://www.jianshu.com/", link: "https://www.jianshu.com/p/b1d54fd570ef")
        let bk2 = XDBBookMarkModel.init(title: "研发、运营必备实用工具网站", domain: "https://blog.csdn.net/", link: "https://blog.csdn.net/m0_38106923/article/details/100130354")
        let bk3 = XDBBookMarkModel.init(title: "非标准交易 · 《Bitcoin Developer Guide》中文版", domain: "https://0dayzh.gitbooks.io/", link: "https://0dayzh.gitbooks.io/bitcoin_developer_guide/content/non-standard_transactions.html")
        let bk4 = XDBBookMarkModel.init(title: "深度工作：充分使用每一份脑力", domain: "https://www.cnblogs.com/", link: "https://www.cnblogs.com/buptzym/p/8059121.html")
        let bk5 = XDBBookMarkModel.init(title: "Swift.org - Documentation", domain: "https://swift.org/", link: "https://swift.org/documentation/")
        let bk6 = XDBBookMarkModel.init(title: "GitBook 简明教程", domain: "http://www.chengweiyang.cn/", link: "http://www.chengweiyang.cn/gitbook/index.html")
        let bk7 = XDBBookMarkModel.init(title: "世界上最好的学习法：费曼学习法", domain: "https://www.choupangxia.com/", link: "https://www.choupangxia.com/2019/09/26/%E4%B8%96%E7%95%8C%E4%B8%8A%E6%9C%80%E5%A5%BD%E7%9A%84%E5%AD%A6%E4%B9%A0%E6%B3%95%EF%BC%9A%E8%B4%B9%E6%9B%BC%E5%AD%A6%E4%B9%A0%E6%B3%95/")
        let bk8 = XDBBookMarkModel.init(title: "Apple Developer Documentation", domain: "https://developer.apple.com/", link: "https://developer.apple.com/documentation")
        let bk9 = XDBBookMarkModel.init(title: "MLEveryday/100-Days-Of-ML-Code: 100-Days-Of-ML-Code中文版", domain: "https://github.com/", link: "https://github.com/MLEveryday/100-Days-Of-ML-Code")
        let bk10 = XDBBookMarkModel.init(title: "MySQL 教程 | 菜鸟教程", domain: "https://www.runoob.com/", link: "https://www.runoob.com/mysql/mysql-tutorial.html")
        self.sourceList = [bk1, bk2, bk3, bk4, bk5, bk6, bk7, bk8, bk9, bk10]
    }

}

// MARK: - Event(事件响应)
extension XDBBookMarkHomeController {
    
}

// MARK; - Request(网络请求)
extension XDBBookMarkHomeController {
    
}

// MARK: - Enter Page
extension XDBBookMarkHomeController {
    fileprivate func enterWebPage(link: String) -> Void {
        let browserVC = XDBrowserWebController.init(strUrl: link)
        self.enterPageVC(browserVC)
    }

}

// MARK: - Notification
extension XDBBookMarkHomeController {
    
}

// MARK: - Extension
extension XDBBookMarkHomeController {
    
}

// MARK: - Delegate Function

// MARK: - <UITableViewDataSource>
extension XDBBookMarkHomeController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sourceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.sourceList[indexPath.row]
        let cell = XDBBookMarkListCell.cellInTableView(tableView, at: indexPath)
        cell.model = model
        return cell
    }
    
    
}

// MARK: - <UITableViewDelegate>
extension XDBBookMarkHomeController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return UITableView.automaticDimension
        return XDBBookMarkListCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt\(indexPath.row)")
        let model = self.sourceList[indexPath.row]
        self.enterWebPage(link: model.link)
    }
    
}

