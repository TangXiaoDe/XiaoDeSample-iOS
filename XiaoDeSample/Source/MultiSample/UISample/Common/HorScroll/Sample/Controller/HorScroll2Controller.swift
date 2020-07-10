//
//  HorScroll2Controller.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/8.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  导航栏为自定义标题栏方式多页滚动

import UIKit

class HorScroll2Controller: BaseViewController
{
    // MARK: - Internal Property
    
    var defaultSelectedIndex: Int = 0
    
    // MARK: - Private Property
    fileprivate let titleView: HorScroll2NavTitleView = HorScroll2NavTitleView.init()
    fileprivate let scrollView: UIScrollView = UIScrollView.init()
    // 实际上可能每个列表是不同类型的控制器，需要提取基类或协议；
    fileprivate var childVCList: [BaseViewController] = []
    fileprivate let followListVC = HorScrollListController.init(type: .follow)
    fileprivate let recommentListVC = HorScrollListController.init(type: .recommend)
    fileprivate let aroundListVC = HorScrollListController.init(type: .nearby)
    
    //fileprivate let types: [HorScrollListType] = [.follow, .recommend, .nearby]
    fileprivate let titles: [String] = [HorScrollListType.follow.title, HorScrollListType.recommend.title, HorScrollListType.nearby.title]
    
    fileprivate(set) var selectedIndex: Int = 0 {
        didSet {
            if self.isFirstSetSelectedIndex {
                self.isFirstSetSelectedIndex = false
                return
            }
            self.titleView.selectedIndex = selectedIndex
            self.scrollView.setContentOffset(CGPoint(x: CGFloat(selectedIndex) * kScreenWidth, y: 0), animated: true)
            for (index, _) in self.childVCList.enumerated() {
                self.childVCList[selectedIndex].isSelected = index == selectedIndex
            }
        }
    }
    fileprivate var isFirstSetSelectedIndex: Bool = true
    
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
extension HorScroll2Controller {
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
extension HorScroll2Controller {
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
        let childVCList: [HorScrollListController] = [self.followListVC, self.recommentListVC, self.aroundListVC]
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
extension HorScroll2Controller {
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
extension HorScroll2Controller {
    
    /// segment点击响应
    @objc fileprivate func segmentClick(_ segment: UISegmentedControl) -> Void {
        let index = segment.selectedSegmentIndex
        self.selectedIndex = index
    }

}

// MARK: - Notification
extension HorScroll2Controller {
    
}

// MARK: - Extension Function
extension HorScroll2Controller {
    
}

// MARK: - Delegate Function

// MARK: - <UIScrollViewDelegate>
extension HorScroll2Controller: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    /// 滑动结束 回调
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let scrollIndex: Int = Int((scrollView.contentOffset.x + kScreenWidth * 0.5) / kScreenWidth)
        self.selectedIndex = scrollIndex
    }

}

// MARK: - <HorScroll2NavTitleViewProtocol>
extension HorScroll2Controller: HorScroll2NavTitleViewProtocol {
    func titleView(_ titleView: HorScroll2NavTitleView, didClicked title: String, at index: Int) -> Void {
        self.selectedIndex = index
    }

}


