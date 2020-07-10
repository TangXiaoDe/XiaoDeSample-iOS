//
//  HorScroll6Controller.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/9.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  HorScroll6 —— 标题列表根据请求结果数来加载

import UIKit

class HorScroll6Controller: BaseViewController
{
    // MARK: - Internal Property
    
    var defaultSelectedIndex: Int = 0
    
    // MARK: - Private Property
    
    fileprivate let sectionView: HorScroll6TitleView = HorScroll6TitleView.init()
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
    
    fileprivate var types: [HorScrollListType] = [] {
        didSet {
            self.setupScrollView(types: types)
            self.sectionView.types = types
        }
    }
    
    fileprivate let sectionHeight: CGFloat = HorScroll6TitleView.viewHeight

    
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
extension HorScroll6Controller {
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
extension HorScroll6Controller {
    /// 页面布局
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // navigationBar
        self.navigationItem.title = "HorScroll6"
        // titleSecton
        self.view.addSubview(self.sectionView)
        self.sectionView.delegate = self
        self.sectionView.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(self.sectionHeight)
        }
        // scrollView
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            //make.edges.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(self.sectionView.snp.bottom)
        }
    }
    
    
    /// scrollView 布局
    fileprivate func setupScrollView(types: [HorScrollListType]) -> Void {
        self.scrollView.isPagingEnabled = true
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.delegate = self
        self.scrollView.removeAllSubView()
        self.childVCList.removeAll()
        // childs
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
extension HorScroll6Controller {
    /// 默认数据加载
    fileprivate func initialDataSource() -> Void {
        // 数据加载
        self.showLoading()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            self.hiddenLoading(for: .normal)
            self.types = [.follow, .recommend, .nearby, .all, .toreview, .doing, .passed, .rejected]
            self.defaultSelectedIndex = 1
            self.sectionView.defaultSelectedIndex = self.defaultSelectedIndex
            self.scrollView.setContentOffset(CGPoint.init(x: kScreenWidth * CGFloat(self.defaultSelectedIndex), y: 0), animated: false)
            for (index, childVC) in self.childVCList.enumerated() {
                childVC.isSelected = index == self.defaultSelectedIndex
            }
            self.selectedIndex = self.defaultSelectedIndex
        }
    }

}

// MARK: - Event(事件响应)
extension HorScroll6Controller {
    
    /// segment点击响应
    @objc fileprivate func segmentClick(_ segment: UISegmentedControl) -> Void {
        let index = segment.selectedSegmentIndex
        self.selectedIndex = index
    }

}

// MARK: - Notification
extension HorScroll6Controller {
    
}

// MARK: - Extension Function
extension HorScroll6Controller {
    
}

// MARK: - Delegate Function

// MARK: - <UIScrollViewDelegate>
extension HorScroll6Controller: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    /// 滑动结束 回调
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let scrollIndex: Int = Int((scrollView.contentOffset.x + kScreenWidth * 0.5) / kScreenWidth)
        self.selectedIndex = scrollIndex
    }

}

// MARK: - <HorScroll4TitleViewProtocol>
extension HorScroll6Controller: HorScroll6TitleViewProtocol {
    func titleView(_ titleView: HorScroll6TitleView, didClickedAt index: Int, with type: HorScrollListType) -> Void {
        self.selectedIndex = index
    }

}


