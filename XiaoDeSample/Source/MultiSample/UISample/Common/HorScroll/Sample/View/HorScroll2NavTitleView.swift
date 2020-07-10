//
//  HorScroll2NavTitleView.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/10.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  HorScroll2的导航栏标标题

import UIKit

protocol HorScroll2NavTitleViewProtocol: class {
    func titleView(_ titleView: HorScroll2NavTitleView, didClicked title: String, at index: Int) -> Void
}

/// HorScroll2的导航标题视图
class HorScroll2NavTitleView: UIView
{

    // MARK: - Internal Property

    static let viewHeight: CGFloat = 44
    
    var models: [String] = [] {
        didSet {
            self.setupWithModels(models)
        }
    }

    /// 需先设置models
    var defaultSelectedIndex: Int = 0 {
        didSet {
            self.selectedIndex = defaultSelectedIndex
        }
    }
    /// 当前选中索引
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
            self.sliderView.isHidden = !showSlider
        }
    }
    
    /// 回调
    weak var delegate: HorScroll2NavTitleViewProtocol?
    var titleClickAction: ((_ titleView: HorScroll2NavTitleView, _ title: String, _ index: Int) -> Void)?

    // MARK: - Private Property

    let mainView: UIView = UIView()
    fileprivate let sliderView: UIView = UIView()
    fileprivate weak var myTaskItemView: UIButton!
    fileprivate weak var myOrderItemView: UIButton!

    fileprivate let sliderViewH: CGFloat = 3
    fileprivate let sliderViewW: CGFloat = 24
    fileprivate var itemViewWidth: CGFloat = 64

    fileprivate let itemViewTagBase: Int = 250
    fileprivate var itemViewList: [UIButton] = []

    /// 当前选中按钮
    fileprivate var selectedItemView: UIButton?

    override var intrinsicContentSize: CGSize {
        return CGSize.init(width: CGFloat(self.models.count) * itemViewWidth, height: HorScroll2NavTitleView.viewHeight)
    }

    // MARK: - Initialize Function
    init(_ itemViewWidthidth: CGFloat? = nil) {
        super.init(frame: CGRect.zero)
        if let itemViewWidthidth = itemViewWidthidth {
            self.itemViewWidth = itemViewWidthidth
        }
        self.commonInit()
    }
    init() {
        super.init(frame: CGRect.zero)
        self.commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
        //fatalError("init(coder:) has not been implemented")
    }

    /// 通用初始化：UI、配置、数据等
    fileprivate func commonInit() -> Void {
        self.initialUI()
    }

}

// MARK: - Internal Function
extension HorScroll2NavTitleView {
    class func loadXib() -> HorScroll2NavTitleView? {
        return Bundle.main.loadNibNamed("HorScroll2NavTitleView", owner: nil, options: nil)?.first as? HorScroll2NavTitleView
    }

    //// 外界动态更新索引 - 待优化解决selectedIndex的设置问题
    //func setupSelectedIndex(_ selectedIndex: Int, animation: Bool) -> Void {
    //    self.didSetupSelectedIndex(selectedIndex, animation: animation)
    //    //self.selectedIndex = selectedIndex
    //}

}

// MARK: - LifeCircle Function
extension HorScroll2NavTitleView {
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
extension HorScroll2NavTitleView {

    /// 界面布局
    fileprivate func initialUI() -> Void {
        self.addSubview(self.mainView)
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    /// mainView根据数据来进行布局
    fileprivate func setupMainView(with titles: [String]) -> Void {
        mainView.removeAllSubView()
        // buttons
        let btnMaxW: CGFloat = self.itemViewWidth
        for (index, title) in titles.enumerated() {
            let button: UIButton = UIButton.init(type: .custom)
            mainView.addSubview(button)
            button.set(title: title, titleColor: UIColor.white, for: .normal)
            button.set(title: title, titleColor: AppColor.theme, for: .selected)
            button.set(font: UIFont.pingFangSCFont(size: 16, weight: .regular))
            button.tag = self.itemViewTagBase + index
            button.addTarget(self, action: #selector(itemViewClick(_:)), for: .touchUpInside)
            button.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 25, bottom: 0, right: 25)
            button.snp.makeConstraints { (make) in
                make.top.bottom.equalToSuperview()
                make.centerX.equalTo(btnMaxW * (CGFloat(index) + 0.5))
            }
            itemViewList.append(button)
        }
        self.myTaskItemView = (mainView.viewWithTag(self.itemViewTagBase + 0) as! UIButton)
        self.myOrderItemView = (mainView.viewWithTag(self.itemViewTagBase + 1) as! UIButton)
        // slider
        mainView.addSubview(self.sliderView)
        self.sliderView.backgroundColor = AppColor.theme
        self.sliderView.set(cornerRadius: self.sliderViewH * 0.5)
        self.sliderView.snp.makeConstraints { (make) in
            make.width.equalTo(self.sliderViewW)
            make.height.equalTo(self.sliderViewH)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        // 默认选中
        if let selectedBtn = mainView.viewWithTag(self.itemViewTagBase + self.selectedIndex) as? UIButton {
            selectedBtn.isSelected = true
            self.selectedItemView = selectedBtn
            self.selectedItemView?.set(font: UIFont.pingFangSCFont(size: 18, weight: .medium))
            self.sliderView.snp.remakeConstraints { (make) in
                make.width.equalTo(self.sliderViewW)
                make.height.equalTo(self.sliderViewH)
                make.bottom.equalToSuperview()
                make.centerX.equalTo(selectedBtn)
            }
        }
    }

}
// MARK: - Private UI Xib加载后处理
extension HorScroll2NavTitleView {
    /// awakeNib时的处理
    fileprivate func initialInAwakeNib() -> Void {

    }
}

// MARK: - Data Function
extension HorScroll2NavTitleView {
    /// 数据加载
    fileprivate func setupWithModels(_ models: [String]) -> Void {
        self.setupMainView(with: models)
    }
    
    /// 选中设置处理
    fileprivate func didSetupSelectedIndex(_ selectedIndex: Int, animation: Bool) -> Void {
        guard let button = self.mainView.viewWithTag(self.itemViewTagBase + selectedIndex) as? UIButton else {
            return
        }
        self.selectedItemView?.isSelected = false
        self.selectedItemView?.set(font: UIFont.pingFangSCFont(size: 16))
        button.isSelected = true
        button.set(font: UIFont.pingFangSCFont(size: 18, weight: .medium))
        self.selectedItemView = button
        self.sliderView.snp.remakeConstraints { (make) in
            make.width.equalTo(self.sliderViewW)
            make.height.equalTo(self.sliderViewH)
            make.bottom.equalToSuperview()
            make.centerX.equalTo(button)
        }
        if animation {
            UIView.animate(withDuration: 0.25) {
                self.mainView.layoutIfNeeded()
            }
        }
    }

}

// MARK: - Event Function
extension HorScroll2NavTitleView {
    /// 按钮点击
    @objc fileprivate func itemViewClick(_ button: UIButton) -> Void {
        if button.isSelected {
            return
        }
        let index: Int = button.tag - self.itemViewTagBase
        self.selectedIndex = index
        let model = self.models[index]
        self.delegate?.titleView(self, didClicked: model, at: index)
        self.titleClickAction?(self, model, index)
    }

}

// MARK: - Extension Function
extension HorScroll2NavTitleView {

}

// MARK: - Delegate Function

// MARK: - <XXXDelegate>
extension HorScroll2NavTitleView {

}
