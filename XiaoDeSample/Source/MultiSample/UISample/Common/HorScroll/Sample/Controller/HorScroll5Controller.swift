//
//  HorScroll5Controller.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/8.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  导航栏2个自定义标题，每个自定义导航栏标题下有各自的标题及页面列表

import UIKit

class HorScroll5Controller: BaseViewController
{
    // MARK: - Internal Property
    
    var defaultSelectedIndex: Int = 0
    
    // MARK: - Private Property
    fileprivate let scrollView: UIScrollView = UIScrollView.init()
    fileprivate let myTaskVC = HorScroll51Controller.init()
    fileprivate let myOrderVC = HorScroll52Controller.init()
    fileprivate var childVCList: [BaseViewController] = []
    
    fileprivate let titles: [String] = ["我的任务", "我的订单"]
    fileprivate let titleView: HorScroll5NavTitleView = HorScroll5NavTitleView.init()
    
    fileprivate(set) var selectedIndex: Int = 0 {
        didSet {
            if self.isFirstSelectedIndex {
                self.isFirstSelectedIndex = false
                return
            }
            self.titleView.selectedIndex = selectedIndex
            self.scrollView.setContentOffset(CGPoint(x: CGFloat(selectedIndex) * kScreenWidth, y: 0), animated: true)
            for (index, _) in self.childVCList.enumerated() {
                self.childVCList[selectedIndex].isSelected = index == selectedIndex
            }
        }
    }
    fileprivate var isFirstSelectedIndex: Bool = true
    
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
extension HorScroll5Controller {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialUI()
        self.initialDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

// MARK: - UI
extension HorScroll5Controller {
    /// 页面布局
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // navigationBar
        self.titleView.models = self.titles
        self.titleView.delegate = self
        self.navigationItem.titleView = self.titleView
        // scrollView
        self.view.addSubview(self.scrollView)
        self.initialScrollView(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        // 顶部位置 的版本适配
        if #available(iOS 11.0, *) {
            self.scrollView.contentInsetAdjustmentBehavior = .never
        } else if #available(iOS 9.0, *) {
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    /// scrollView 布局
    fileprivate func initialScrollView(_ scrollView: UIScrollView) -> Void {
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        // childs
        let scrollViewH: CGFloat = kScreenHeight - kNavigationStatusBarHeight   // - kTabBarHeight
        let childVCList: [BaseViewController] = [self.myTaskVC, self.myOrderVC]
        var leftView: UIView = scrollView
        for (index, childVC) in childVCList.enumerated() {
            let childView: UIView = UIView()
            scrollView.addSubview(childView)
            childView.snp.makeConstraints { (make) in
                make.width.equalTo(kScreenWidth)
                make.top.bottom.height.equalToSuperview()
                if 0 == index {
                    make.leading.equalToSuperview()
                } else {
                    make.leading.equalTo(leftView.snp.trailing)
                }
                if index == childVCList.count - 1 {
                    make.trailing.equalToSuperview()
                }
            }
            leftView = childView
            // childVC
            self.addChild(childVC)
            childView.addSubview(childVC.view)
            childVC.view.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            self.childVCList.append(childVC)
        }
        scrollView.contentSize = CGSize.init(width: kScreenWidth * CGFloat(childVCList.count), height: scrollViewH)
    }
    
}

// MARK: - Data(数据处理与加载)
extension HorScroll5Controller {
    /// 默认数据加载
    fileprivate func initialDataSource() -> Void {
        // 默认选择
        self.defaultSelectedIndex = 1
        self.titleView.defaultSelectedIndex = self.defaultSelectedIndex
        self.scrollView.setContentOffset(CGPoint.init(x: kScreenWidth * CGFloat(self.defaultSelectedIndex), y: 0), animated: false)
        for (index, childVC) in self.childVCList.enumerated() {
            childVC.isSelected = index == self.defaultSelectedIndex
        }
        self.selectedIndex = self.defaultSelectedIndex
    }

}

// MARK: - Event(事件响应)
extension HorScroll5Controller {
    
    /// segment点击响应
    @objc fileprivate func segmentClick(_ segment: UISegmentedControl) -> Void {
        let index = segment.selectedSegmentIndex
        self.selectedIndex = index
    }

}

// MARK: - Notification
extension HorScroll5Controller {
    
}

// MARK: - Extension Function
extension HorScroll5Controller {
    
}

// MARK: - Delegate Function

// MARK: - <UIScrollViewDelegate>
extension HorScroll5Controller: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    /// 滑动结束 回调
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let scrollIndex: Int = Int((scrollView.contentOffset.x + kScreenWidth * 0.5) / kScreenWidth)
        self.selectedIndex = scrollIndex
    }

}

// MARK: - <HorScroll5NavTitleViewProtocol>
extension HorScroll5Controller: HorScroll5NavTitleViewProtocol {
    func titleView(_ titleView: HorScroll5NavTitleView, didClicked title: String, at index: Int) -> Void {
        self.selectedIndex = index
    }

}

