//
//  HorScroll51Controller.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/8.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  HorScroll5中的左侧列表 - 我的任务

import UIKit

class HorScroll51Controller: BaseViewController
{
    // MARK: - Internal Property
    
    var defaultSelectedIndex: Int = 0
    
    override var isSelected: Bool {
        didSet {
            self.childVCList[selectedIndex].isSelected = isSelected
        }
    }
    
    // MARK: - Private Property
    
    fileprivate let sectionView: HorScroll51TitleView = HorScroll51TitleView.init()
    fileprivate let scrollView: UIScrollView = UIScrollView.init()
    
    fileprivate var childVCList: [HorScrollListController] = []
    fileprivate(set) var selectedIndex: Int = 0 {
        didSet {
            if self.isFirstSetSelectedIndex {
                self.isFirstSetSelectedIndex = false
                return
            }
            self.sectionView.selectedIndex = selectedIndex
            self.scrollView.setContentOffset(CGPoint(x: CGFloat(selectedIndex) * kScreenWidth, y: 0), animated: true)
            for (index, _) in self.childVCList.enumerated() {
                self.childVCList[selectedIndex].isSelected = index == selectedIndex
            }
        }
    }
    fileprivate var isFirstSetSelectedIndex: Bool = true
    
    fileprivate var types: [HorScrollListType] = [.all, .toreview, .doing, .passed, .rejected]
    
    fileprivate let sectionHeight: CGFloat = HorScroll51TitleView.viewHeight

    
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
extension HorScroll51Controller {
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
extension HorScroll51Controller {
    /// 页面布局
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // navigationBar
        self.navigationItem.title = "HorScroll51"
        // titleSecton
        self.view.addSubview(self.sectionView)
        self.sectionView.delegate = self
        self.sectionView.types = self.types
        self.sectionView.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(self.sectionHeight)
        }
        // scrollView
        self.view.addSubview(self.scrollView)
        self.setupScrollView(types: self.types)
        self.scrollView.snp.makeConstraints { (make) in
            //make.edges.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(self.sectionView.snp.bottom)
        }
    }

    /// scrollView 布局
    fileprivate func setupScrollView(types: [HorScrollListType]) -> Void {
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        // childs
        scrollView.removeAllSubView()
        self.childVCList.removeAll()
        let scrollViewH: CGFloat = kScreenHeight - kNavigationStatusBarHeight - self.sectionHeight   // - kTabBarHeight
        var leftView: UIView = self.scrollView
        for (index, type) in types.enumerated() {
            let childVC = HorScrollListController.init(type: type)
            let childView: UIView = UIView()
            self.scrollView.addSubview(childView)
            childView.snp.makeConstraints { (make) in
                make.width.equalTo(kScreenWidth)
                make.top.bottom.height.equalToSuperview()
                if 0 == index {
                    make.leading.equalToSuperview()
                } else {
                    make.leading.equalTo(leftView.snp.trailing)
                }
                if index == self.types.count - 1 {
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
extension HorScroll51Controller {
    /// 默认数据加载
    fileprivate func initialDataSource() -> Void {
        // 默认选择
        self.defaultSelectedIndex = 1
        self.sectionView.defaultSelectedIndex = self.defaultSelectedIndex
        self.scrollView.setContentOffset(CGPoint.init(x: kScreenWidth * CGFloat(self.defaultSelectedIndex), y: 0), animated: false)
        // 注，该界面属于HorScroll5的子界面，其数据加载需等主界面选中处理
        //for (index, childVC) in self.childVCList.enumerated() {
        //    childVC.isSelected = index == self.defaultSelectedIndex
        //}
        self.selectedIndex = self.defaultSelectedIndex
    }

}

// MARK: - Event(事件响应)
extension HorScroll51Controller {
    
    /// segment点击响应
    @objc fileprivate func segmentClick(_ segment: UISegmentedControl) -> Void {
        let index = segment.selectedSegmentIndex
        self.selectedIndex = index
    }

}

// MARK: - Notification
extension HorScroll51Controller {
    
}

// MARK: - Extension Function
extension HorScroll51Controller {
    
}

// MARK: - Delegate Function

// MARK: - <UIScrollViewDelegate>
extension HorScroll51Controller: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    /// 滑动结束 回调
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let scrollIndex: Int = Int((scrollView.contentOffset.x + kScreenWidth * 0.5) / kScreenWidth)
        self.selectedIndex = scrollIndex
    }

}

// MARK: - <HorScroll4TitleViewProtocol>
extension HorScroll51Controller: HorScroll51TitleViewProtocol {
    func titleView(_ titleView: HorScroll51TitleView, didClickedAt index: Int, with type: HorScrollListType) -> Void {
        self.selectedIndex = index
    }

}


