//
//  HorScroll3TitleView.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/10.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  HorScroll3中使用的标题选择控件，
//  类型由外界传入，但不应过多；重点等分处理，且不考虑滑动问题；

import UIKit

protocol HorScroll3TitleViewProtocol: class {
    func titleView(_ titleView: HorScroll3TitleView, didClickedAt index: Int, with type: HorScrollListType) -> Void
}

typealias HorScroll3TitleSectionView = HorScroll3TitleView
class HorScroll3TitleView: UIView
{

    // MARK: - Internal Property

    static let viewHeight: CGFloat = 44

    weak var delegate: HorScroll3TitleViewProtocol?
    var titleClickAction:((_ titleView: HorScroll3TitleView, _ index: Int, _ type: HorScrollListType) -> Void)?

    var types: [HorScrollListType] = [] {
        didSet {
            self.setupTypes(types)
        }
    }
    
    /// 默认选中索引，需先设置types
    var defaultSelectedIndex: Int = 0 {
        didSet {
            self.selectedIndex = defaultSelectedIndex
        }
    }
    /// 当前选中索引，需先设置types
    var selectedIndex: Int = 0 {
        didSet {
            self.didSetupSelectedIndex(selectedIndex, animation: !self.isFirstSetSelectedIndex)
            if self.isFirstSetSelectedIndex {
                self.isFirstSetSelectedIndex = false
            }
        }
    }
    fileprivate var isFirstSetSelectedIndex: Bool = true

    var showSlider: Bool = true {
        didSet {
            self.slider.isHidden = !showSlider
        }
    }
    
    // MARK: - Private Property
    fileprivate let mainView: UIView = UIView()
    fileprivate let slider: UIView = UIView()
    fileprivate let itemViewTagBase: Int = 250
    
    fileprivate let lrMargin: CGFloat = 12
    fileprivate let itemHorMargin: CGFloat = 20
    fileprivate let sliderViewW: CGFloat = 30
    fileprivate let sliderViewH: CGFloat = 3

    fileprivate var selectedItemView: UIButton? = nil

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
extension HorScroll3TitleView {
    class func loadXib() -> HorScroll3TitleView? {
        return Bundle.main.loadNibNamed("HorScroll3TitleView", owner: nil, options: nil)?.first as? HorScroll3TitleView
    }
    
    //// 外界动态更新索引 - 待优化解决selectedIndex的设置问题
    //func setupSelectedIndex(_ selectedIndex: Int, animation: Bool) -> Void {
    //    self.didSetupSelectedIndex(selectedIndex, animation: animation)
    //    //self.selectedIndex = selectedIndex
    //}
    
}

// MARK: - LifeCircle Function
extension HorScroll3TitleView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialInAwakeNib()
    }
    
    /// 布局子控件
    override func layoutSubviews() {
        super.layoutSubviews()
        // 默认选中
        //self.didSetupSelectedIndex(self.defaultSelectedIndex, animation: false)
    }
    
}
// MARK: - Private UI 手动布局
extension HorScroll3TitleView {

    /// 界面布局
    fileprivate func initialUI() -> Void {
        // mainView
        self.addSubview(self.mainView)
        self.backgroundColor = UIColor.white
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        // bottomLine
        self.addLineWithSide(.inBottom, color: UIColor.init(hex: 0xe2e2e2), thickness: 0.5, margin1: 0, margin2: 0)
    }
    
    /// 根据types来设置mainView
    fileprivate func setupMainView(with types: [HorScrollListType]) -> Void {
        self.mainView.removeAllSubView()
        if types.isEmpty {
            return
        }
        let itemWidth: CGFloat = (kScreenWidth - self.lrMargin * 2.0 - self.itemHorMargin * CGFloat(types.count - 1)) / CGFloat(types.count)
        // 1. titleBtn
        var leftView: UIView = self.mainView
        for (index, type) in self.types.enumerated() {
            let button = UIButton.init(type: .custom)
            self.mainView.addSubview(button)
            button.set(title: type.title, titleColor: UIColor(hex: 0x525C6E), for: .normal)
            button.set(title: type.title, titleColor: AppColor.theme, for: .selected)
            button.set(font: UIFont.pingFangSCFont(size: 14))
            button.tag = self.itemViewTagBase + index
            button.addTarget(self, action: #selector(titleBtnClick(_:)), for: .touchUpInside)
//            var itemW: CGFloat = type.title.size(maxSize: CGSize.max, font: UIFont.pingFangSCFont(size: 14, weight: .medium)).width + 2
//            itemW = max(itemW, self.itemMinW)
            button.bounds = CGRect.init(x: 0, y: 0, width: itemWidth, height: HorScroll3TitleView.viewHeight)
            button.snp.makeConstraints { (make) in
                make.top.bottom.height.equalToSuperview()
                make.width.equalTo(itemWidth)
                if 0 == index {
                    make.leading.equalToSuperview().offset(self.lrMargin)
                } else {
                    make.leading.equalTo(leftView.snp.trailing).offset(self.itemHorMargin)
                }
                if self.types.count - 1 == index {
                    make.trailing.equalToSuperview().offset(-self.lrMargin)
                }
            }
            leftView = button
        }
        // 2. slider
        self.mainView.addSubview(self.slider)
        self.slider.backgroundColor = AppColor.theme
        self.slider.set(cornerRadius: self.sliderViewH * 0.5)
        self.slider.snp.makeConstraints { (make) in
            make.width.equalTo(sliderViewW)
            make.bottom.equalToSuperview()
            make.height.equalTo(self.sliderViewH)
            make.leading.equalToSuperview().offset(lrMargin)    // 初始位置
        }
        // 默认选中
        if let button = self.mainView.viewWithTag(self.itemViewTagBase + self.defaultSelectedIndex) as? UIButton {
            button.isSelected = true
            button.titleLabel?.font = UIFont.pingFangSCFont(size: 14, weight: .medium)
            self.selectedItemView = button
            self.slider.snp.remakeConstraints { (make) in
                make.bottom.equalToSuperview()
                make.height.equalTo(self.sliderViewH)
                make.centerX.equalTo(button)
                make.width.equalTo(self.sliderViewW)
            }
        }
    }

}
// MARK: - Private UI Xib加载后处理
extension HorScroll3TitleView {
    /// awakeNib时的处理
    fileprivate func initialInAwakeNib() -> Void {

    }
}

// MARK: - Data Function
extension HorScroll3TitleView {

    fileprivate func setupTypes(_ types: [HorScrollListType]) -> Void {
        self.setupMainView(with: types)
    }
    
    /// 索引选中时
    fileprivate func didSetupSelectedIndex(_ selectedIndex: Int, animation: Bool = false) -> Void {
        // selectedItemView
        self.selectedItemView?.isSelected = false
        self.selectedItemView?.titleLabel?.font = UIFont.pingFangSCFont(size: 14)
        guard let button = self.mainView.viewWithTag(self.itemViewTagBase + selectedIndex) as? UIButton else {
            return
        }
        button.isSelected = true
        button.titleLabel?.font = UIFont.pingFangSCFont(size: 14, weight: .medium)
        self.selectedItemView = button
        // slider
        self.slider.snp.remakeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.height.equalTo(self.sliderViewH)
            make.centerX.equalTo(button)
            make.width.equalTo(self.sliderViewW)
        }
        // 注：动画会产生缓存，导致最开始加载时异常
        if animation {
            UIView.animate(withDuration: 0.25) {
                self.layoutIfNeeded()
            }
        }
    }

}

// MARK: - Event Function
extension HorScroll3TitleView {
    @objc fileprivate func titleBtnClick(_ button: UIButton) -> Void {
        let index = button.tag - self.itemViewTagBase
        let type = self.types[index]
        self.delegate?.titleView(self, didClickedAt: index, with: type)
        self.titleClickAction?(self, index, type)
    }
}

// MARK: - Extension Function

