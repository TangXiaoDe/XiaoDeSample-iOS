//
//  HorScroll5NavTitleView.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/9.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  HorScroll5的导航标题视图
//  默认加载：我的任务、我的订单

import UIKit

protocol HorScroll5NavTitleViewProtocol: class {
    func titleView(_ titleView: HorScroll5NavTitleView, didClicked title: String, at index: Int) -> Void
}

/// HorScroll5的导航标题视图
class HorScroll5NavTitleView: UIView
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
            self.setupSelectedIndex(selectedIndex, animation: !self.isFirstSetSelectedIndex)
            if self.isFirstSetSelectedIndex {
                self.isFirstSetSelectedIndex = false
            }
        }
    }
    fileprivate var isFirstSetSelectedIndex: Bool = true

    /// 回调
    weak var delegate: HorScroll5NavTitleViewProtocol?
    var titleClickAction: ((_ titleView: HorScroll5NavTitleView, _ title: String, _ index: Int) -> Void)?

    // MARK: - Private Property

    let mainView: UIView = UIView()
    fileprivate let sliderView: UIView = UIView()
    fileprivate weak var myTaskItemView: UIButton!
    fileprivate weak var myOrderItemView: UIButton!

    fileprivate let sliderViewH: CGFloat = 3
    fileprivate let sliderViewW: CGFloat = 24
    fileprivate var itemW: CGFloat = 100

    fileprivate let itemViewTagBase: Int = 250
    fileprivate var itemViewList: [UIButton] = []

    /// 当前选中按钮
    fileprivate var currentSelectedBtn: UIButton?

    var showSlider: Bool = true {
        didSet {
            self.sliderView.isHidden = !showSlider
        }
    }
    override var intrinsicContentSize: CGSize {
        return CGSize.init(width: CGFloat(self.models.count) * itemW, height: HorScroll5NavTitleView.viewHeight)
    }

    // MARK: - Initialize Function
    init(_ itemWidth: CGFloat? = nil) {
        super.init(frame: CGRect.zero)
        if let itemWidth = itemWidth {
            self.itemW = itemWidth
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
extension HorScroll5NavTitleView {
    class func loadXib() -> HorScroll5NavTitleView? {
        return Bundle.main.loadNibNamed("HorScroll5NavTitleView", owner: nil, options: nil)?.first as? HorScroll5NavTitleView
    }

    ///
    //func setSelectedIndex(_ selectedIndex: Int, animation: Bool) -> Void {
    //}

}

// MARK: - LifeCircle Function
extension HorScroll5NavTitleView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialInAwakeNib()
    }

    /// 布局子控件
    override func layoutSubviews() {
        super.layoutSubviews()

    }

}
// MARK: - Private UI 手动布局
extension HorScroll5NavTitleView {

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
        let btnMaxW: CGFloat = self.itemW
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
            self.currentSelectedBtn = selectedBtn
            self.currentSelectedBtn?.set(font: UIFont.pingFangSCFont(size: 18, weight: .medium))
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
extension HorScroll5NavTitleView {
    /// awakeNib时的处理
    fileprivate func initialInAwakeNib() -> Void {

    }
}

// MARK: - Data Function
extension HorScroll5NavTitleView {
    /// 数据加载
    fileprivate func setupWithModels(_ models: [String]) -> Void {
        self.setupMainView(with: models)
    }
    
    /// 选中设置处理
    fileprivate func setupSelectedIndex(_ selectedIndex: Int, animation: Bool) -> Void {
        guard let button = self.mainView.viewWithTag(self.itemViewTagBase + selectedIndex) as? UIButton else {
            return
        }
        self.currentSelectedBtn?.isSelected = false
        self.currentSelectedBtn?.set(font: UIFont.pingFangSCFont(size: 16))
        button.isSelected = true
        button.set(font: UIFont.pingFangSCFont(size: 18, weight: .medium))
        self.currentSelectedBtn = button
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
extension HorScroll5NavTitleView {
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
extension HorScroll5NavTitleView {

}

// MARK: - Delegate Function

// MARK: - <XXXDelegate>
extension HorScroll5NavTitleView {

}
