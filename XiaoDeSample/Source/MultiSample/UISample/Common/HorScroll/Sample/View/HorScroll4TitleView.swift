//
//  HorScroll4TitleView.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/9.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  HorScroll4中使用的标题选择控件
//  固定类型

import UIKit

protocol HorScroll4TitleViewProtocol: class {
    func titleView(_ titleView: HorScroll4TitleView, didClickedAt index: Int, with type: HorScrollListType) -> Void
}

typealias HorScroll4TitleSectionView = HorScroll4TitleView
class HorScroll4TitleView: UIView
{

    // MARK: - Internal Property

    static let viewHeight: CGFloat = 44

    weak var delegate: HorScroll4TitleViewProtocol?
    var titleClickAction:((_ titleView: HorScroll4TitleView, _ index: Int, _ type: HorScrollListType) -> Void)?

    var defaultSelectedIndex: Int = 0 {
        didSet {
            //self.didSetupSelectedIndex(defaultSelectedIndex, animation: false)
            self.selectedIndex = defaultSelectedIndex
        }
    }
    var selectedIndex: Int = 0 {
        didSet {
            self.didSetupSelectedIndex(selectedIndex, animation: !self.isFirstSetSelectedIndex)
            if self.isFirstSetSelectedIndex {
                self.isFirstSetSelectedIndex = false
            }
        }
    }
    fileprivate var isFirstSetSelectedIndex: Bool = true

    // MARK: - Private Property
    fileprivate let mainView: UIView = UIView()
    fileprivate let scrollView: UIScrollView = UIScrollView.init()
    fileprivate let slider: UIView = UIView()
    fileprivate let titleBtnTagBase: Int = 250

    //fileprivate let titles: [String] = ["关注", "推荐", "附近", "全部", "待审核", "进行中", "已通过", "已拒绝"]
    fileprivate let types: [HorScrollListType] = [.follow, .recommend, .nearby, .all, .toreview, .doing, .passed, .rejected]
    
    fileprivate let lrMargin: CGFloat = 12
    fileprivate let sliderViewW: CGFloat = 30
    fileprivate let sliderViewH: CGFloat = 3
    fileprivate let itemMinW: CGFloat = 30
    fileprivate let itemHorMinMargin: CGFloat = 20

    fileprivate var selectedBtn: UIButton? = nil

    // MARK: - Initialize Function
    init() {
        super.init(frame: CGRect.zero)
        self.initialUI()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Internal Function
extension HorScroll4TitleView {
    class func loadXib() -> HorScroll4TitleView? {
        return Bundle.main.loadNibNamed("HorScroll4TitleView", owner: nil, options: nil)?.first as? HorScroll4TitleView
    }
    
    /// 索引选中时
    func setupSelectedIndex(_ selectedIndex: Int, animation: Bool) -> Void {
        self.didSetupSelectedIndex(selectedIndex, animation: animation)
    }

    
}

// MARK: - LifeCircle Function
extension HorScroll4TitleView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialInAwakeNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 默认选中
        //self.didSetupSelectedIndex(self.defaultSelectedIndex, animation: false)
    }
    
}
// MARK: - Private UI 手动布局
extension HorScroll4TitleView {

    /// 界面布局
    fileprivate func initialUI() -> Void {
        // mainView
        self.addSubview(self.mainView)
        self.initialMainView(self.mainView)
        self.backgroundColor = UIColor.white
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    fileprivate func initialMainView(_ mainView: UIView) -> Void {
        // 1. scrollView
        mainView.addSubview(self.scrollView)
        self.initialScrollView(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        // 2. bottomLine
        mainView.addLineWithSide(.inBottom, color: UIColor.init(hex: 0xe2e2e2), thickness: 0.5, margin1: 0, margin2: 0)
    }
    fileprivate func initialScrollView(_ scrollView: UIScrollView) -> Void {
        let horMargin: CGFloat = self.calcHorMargin()
        // 0. scrollView
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        // 1. titleBtn
        var leftView: UIView = scrollView
        for (index, type) in self.types.enumerated() {
            let button = UIButton.init(type: .custom)
            scrollView.addSubview(button)
            button.set(title: type.title, titleColor: UIColor(hex: 0x525C6E), for: .normal)
            button.set(title: type.title, titleColor: AppColor.theme, for: .selected)
            button.set(font: UIFont.pingFangSCFont(size: 14))
            button.tag = self.titleBtnTagBase + index
            button.addTarget(self, action: #selector(titleBtnClick(_:)), for: .touchUpInside)
            var itemW: CGFloat = type.title.size(maxSize: CGSize.max, font: UIFont.pingFangSCFont(size: 14, weight: .medium)).width + 2
            itemW = max(itemW, self.itemMinW)
            button.bounds = CGRect.init(x: 0, y: 0, width: itemW, height: HorScroll4TitleView.viewHeight)
            button.snp.makeConstraints { (make) in
                make.top.bottom.height.equalToSuperview()
                make.width.equalTo(itemW)
                if 0 == index {
                    make.leading.equalToSuperview().offset(self.lrMargin)
                } else {
                    make.leading.equalTo(leftView.snp.trailing).offset(horMargin)
                }
                if self.types.count - 1 == index {
                    make.trailing.equalToSuperview().offset(-self.lrMargin)
                }
            }
            leftView = button
        }
        // 2. slider
        scrollView.addSubview(self.slider)
        self.slider.backgroundColor = AppColor.theme
        self.slider.set(cornerRadius: self.sliderViewH * 0.5)
        self.slider.snp.makeConstraints { (make) in
            make.width.equalTo(sliderViewW)
            make.bottom.equalToSuperview()
            make.height.equalTo(self.sliderViewH)
            make.leading.equalToSuperview().offset(lrMargin)    // 初始位置
        }
        // 默认选中
        if let button = self.mainView.viewWithTag(self.titleBtnTagBase + self.defaultSelectedIndex) as? UIButton {
            button.isSelected = true
            button.titleLabel?.font = UIFont.pingFangSCFont(size: 14, weight: .medium)
            self.selectedBtn = button
            self.slider.snp.remakeConstraints { (make) in
                make.bottom.equalToSuperview()
                make.height.equalTo(self.sliderViewH)
                make.centerX.equalTo(button)
                make.width.equalTo(button.bounds.size.width - 4)
            }
        }
    }
    
    fileprivate func calcHorMargin() -> CGFloat {
        var fixedWidth: CGFloat = self.lrMargin * 2.0
        for (_, type) in self.types.enumerated() {
            var itemW: CGFloat = type.title.size(maxSize: CGSize.max, font: UIFont.pingFangSCFont(size: 14, weight: .medium)).width + 2
            itemW = max(itemW, self.itemMinW)
            fixedWidth += itemW
        }
        var horMargin: CGFloat = self.itemHorMinMargin
        let calcHorMargin: CGFloat = abs(kScreenWidth - fixedWidth) / CGFloat(self.types.count - 1)
        if kScreenWidth > fixedWidth && calcHorMargin > horMargin {
            horMargin = calcHorMargin
        }
        return horMargin
    }

}
// MARK: - Private UI Xib加载后处理
extension HorScroll4TitleView {
    /// awakeNib时的处理
    fileprivate func initialInAwakeNib() -> Void {

    }
}

// MARK: - Data Function
extension HorScroll4TitleView {

    /// 索引选中时
    fileprivate func didSetupSelectedIndex(_ selectedIndex: Int, animation: Bool = false) -> Void {
        // selectedBtn
        self.selectedBtn?.isSelected = false
        self.selectedBtn?.titleLabel?.font = UIFont.pingFangSCFont(size: 14)
        guard let button = self.mainView.viewWithTag(self.titleBtnTagBase + selectedIndex) as? UIButton else {
            return
        }
        button.isSelected = true
        button.titleLabel?.font = UIFont.pingFangSCFont(size: 14, weight: .medium)
        self.selectedBtn = button
        self.processScrollView(button)
        // slider
        self.slider.snp.remakeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.height.equalTo(self.sliderViewH)
            make.centerX.equalTo(button)
            make.width.equalTo(button.bounds.size.width - 4)
        }
        // 注：动画会产生缓存，导致最开始加载时异常
        if animation {
            UIView.animate(withDuration: 0.25) {
                self.layoutIfNeeded()
            }
        }
    }
    
    /// 处理scroll跟着滚动
    fileprivate func processScrollView(_ button: UIButton) {
        if self.scrollView.contentSize.width <= kScreenWidth {
            return
        }
        // 初始默认设置时，视图布局并未完成，此时设置显示效果的问题
        ////方案1：index方案，限制了按钮宽度必须一致；
        //let btnCenteX: CGFloat = self.btnMaxW * (CGFloat(button.tag - self.itemTagBase) + 0.5)
        ////方案2：frame方案，限制了必须添加frame
        //let btnCenteX: CGFloat = button.frame.origin.x + button.frame.size.width * 0.5

        // 默认居中，左侧不足则靠左，右侧不足则靠右；优先考虑靠左和靠右的特殊情况
        if button.frame.origin.x + button.frame.size.width * 0.5 < kScreenWidth * 0.5 {
            self.scrollView.setContentOffset(CGPoint.zero, animated: true)
        } else if self.scrollView.contentSize.width - button.frame.origin.x - button.frame.size.width * 0.5 < kScreenWidth * 0.5 {
            self.scrollView.setContentOffset(CGPoint.init(x: self.scrollView.contentSize.width - kScreenWidth, y: 0), animated: true)
        } else {
            self.scrollView.setContentOffset(CGPoint.init(x: button.frame.origin.x + button.frame.size.width * 0.5 - kScreenWidth * 0.5, y: 0), animated: true)
        }
    }

}

// MARK: - Event Function
extension HorScroll4TitleView {
    @objc fileprivate func titleBtnClick(_ button: UIButton) -> Void {
        let index = button.tag - self.titleBtnTagBase
        let type = self.types[index]
        self.delegate?.titleView(self, didClickedAt: index, with: type)
        self.titleClickAction?(self, index, type)
    }
}

// MARK: - Extension Function

