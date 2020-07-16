//
//  KeyboardBaseSampleController.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/15.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//


import UIKit


//  键盘类型
//    public enum UIKeyboardType : Int {
//        case `default` = 0 // Default type for the current input method.
//        case asciiCapable = 1 // Displays a keyboard which can enter ASCII characters
//        case numbersAndPunctuation = 2 // Numbers and assorted punctuation.
//        case URL = 3 // A type optimized for URL entry (shows . / .com prominently).
//        case numberPad = 4 // A number pad with locale-appropriate digits (0-9, ۰-۹, ०-९, etc.). Suitable for PIN entry.
//        case phonePad = 5 // A phone pad (1-9, *, 0, #, with letters under the numbers).
//        case namePhonePad = 6 // A type optimized for entering a person's name or phone number.
//        case emailAddress = 7 // A type optimized for multiple email address entry (shows space @ . prominently).
//        @available(iOS 4.1, *)
//        case decimalPad = 8 // A number pad with a decimal point.
//        @available(iOS 5.0, *)
//        case twitter = 9 // A type optimized for twitter text entry (easy access to @ #)
//        @available(iOS 7.0, *)
//        case webSearch = 10 // A default keyboard type with URL-oriented addition (shows space . prominently).
//        @available(iOS 10.0, *)
//        case asciiCapableNumberPad = 11 // A number pad (0-9) that will always be ASCII digits.
//    }


class KeyboardBaseSampleController: BaseViewController
{
    // MARK: - Internal Property
    
    // MARK: - Private Property
    
    
    fileprivate let typeTitleLabel: UILabel = UILabel.init()
    fileprivate let horScrollView: UIScrollView = UIScrollView.init()
    fileprivate let typeContainer: UIView = UIView.init()
    
    fileprivate let inputField: UITextField = UITextField.init()
    
    fileprivate var items: [(type: UIKeyboardType, title: String)] = []
    fileprivate var currentKbType: UIKeyboardType = .default

    fileprivate let itemTagBase: Int = 250
    fileprivate var selectedItemView: UIButton?
        
    fileprivate let lrMargin: CGFloat = 15
    fileprivate let itemHorMargin: CGFloat = 10

    
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

// MARK: - LifeCircle & Override Function
extension KeyboardBaseSampleController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialUI()
        self.initialDataSource()
    }
    
    /// 控制器的view将要显示
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    /// 控制器的view即将消失
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
}

// MARK: - UI
extension KeyboardBaseSampleController {
    /// 页面布局
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = AppColor.pageBg
        // navbar
        self.navigationItem.title = "BaseKeyboard"
        // typeTitle
        self.view.addSubview(self.typeTitleLabel)
        self.typeTitleLabel.set(text: "键盘类型", font: UIFont.pingFangSCFont(size: 15), textColor: UIColor.white)
        self.typeTitleLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(self.lrMargin)
            make.top.equalToSuperview().offset(25)
        }
        // horScrollView
        self.view.addSubview(self.horScrollView)
        self.horScrollView.showsHorizontalScrollIndicator = false
        self.horScrollView.bounces = false
        self.horScrollView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.typeTitleLabel.snp.bottom)
            make.height.equalTo(44)
        }
        // typeContaienr
        self.horScrollView.addSubview(self.typeContainer)
        self.typeContainer.snp.makeConstraints { (make) in
            make.top.bottom.height.leading.equalToSuperview()
            make.trailing.lessThanOrEqualToSuperview()
        }
        // inputField
        self.view.addSubview(self.inputField)
        self.inputField.set(placeHolder: nil, text: nil, font: UIFont.pingFangSCFont(size: 15), textColor: UIColor.init(hex: 0x333333), alignment: .left)
        self.inputField.setPlaceHolder("请输入内容", font: UIFont.pingFangSCFont(size: 15), color: UIColor.init(hex: 0xaaaaaa))
        self.inputField.backgroundColor = UIColor.white
        self.inputField.set(cornerRadius: 5)
        self.inputField.keyboardType = self.currentKbType
        self.inputField.leftView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 15, height: 1))
        self.inputField.leftViewMode = .always
        self.inputField.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(self.lrMargin)
            make.trailing.equalToSuperview().offset(-self.lrMargin)
            make.top.equalTo(self.horScrollView.snp.bottom).offset(25)
            make.height.equalTo(35)
        }
    }
    
    fileprivate func setupTypeContainer(with items: [(type: UIKeyboardType, title: String)]) -> Void {
        self.typeContainer.removeAllSubView()
        var leftView: UIView = self.typeContainer
        for (index, item) in items.enumerated() {
            let itemWidth: CGFloat = item.title.size(maxSize: CGSize.max, font: UIFont.pingFangSCFont(size: 16, weight: .medium)).width + 2
            let itemView: UIButton = UIButton.init(type: .custom)
            self.typeContainer.addSubview(itemView)
            itemView.set(title: item.title, titleColor: UIColor.white, for: .normal)
            itemView.set(title: item.title, titleColor: UIColor.white, for: .highlighted)
            itemView.set(title: item.title, titleColor: UIColor.init(hex: 0x6EEEFC), for: .selected)
            itemView.set(font: UIFont.pingFangSCFont(size: 16))
            itemView.tag = self.itemTagBase + index
            itemView.addTarget(self, action: #selector(typeItemClick(_:)), for: .touchUpInside)
            itemView.snp.makeConstraints { (make) in
                make.top.bottom.equalToSuperview()
                    make.width.equalTo(itemWidth)
                if 0 == index {
                    make.leading.equalToSuperview().offset(self.lrMargin)
                } else {
                    make.leading.equalTo(leftView.snp.trailing).offset(self.itemHorMargin)
                }
                if index == items.count - 1 {
                    make.trailing.equalToSuperview().offset(-self.lrMargin)
                }
            }
            leftView = itemView
            if item.type == self.currentKbType {
                itemView.titleLabel?.font = UIFont.pingFangSCFont(size: 16, weight: .medium)
                itemView.isSelected = true
                self.selectedItemView = itemView
            }
        }
        
    }

}

// MARK: - Data(数据处理与加载)
extension KeyboardBaseSampleController {
    /// 默认数据加载
    fileprivate func initialDataSource() -> Void {
        self.items = [(type: .default, title: "Default"),
                      (type: .asciiCapable, title: "AsciiCapable"),
                      (type: .numbersAndPunctuation, title: "NumbersAndPunctuation"),
                      (type: .URL, title: "URL"),
                      (type: .numberPad, title: "NumberPad"),
                      (type: .phonePad, title: "PhonePad"),
                      (type: .namePhonePad, title: "NamePhonePad"),
                      (type: .emailAddress, title: "EmailAddress"),
                      (type: .decimalPad, title: "DecimalPad"),
                      (type: .twitter, title: "Twitter"),
                      (type: .webSearch, title: "WebSearch")]
        if #available(iOS 10.0, *) {
            self.items.append((type: .asciiCapableNumberPad, title: "AsciiCapableNumberPad"))
        }
        self.setupTypeContainer(with: self.items)
    }
    
    /// 处理scroll跟着滚动
    fileprivate func processScrollView(_ button: UIButton) {
        if self.horScrollView.contentSize.width <= kScreenWidth {
            return
        }
        // 初始默认设置时，视图布局并未完成，此时设置显示效果的问题
        ////方案1：index方案，限制了按钮宽度必须一致；
        //let btnCenteX: CGFloat = self.btnMaxW * (CGFloat(button.tag - self.itemTagBase) + 0.5)
        ////方案2：frame方案，限制了必须添加frame
        //let btnCenteX: CGFloat = button.frame.origin.x + button.frame.size.width * 0.5

        // 默认居中，左侧不足则靠左，右侧不足则靠右；优先考虑靠左和靠右的特殊情况
        if button.frame.origin.x + button.frame.size.width * 0.5 < kScreenWidth * 0.5 {
            self.horScrollView.setContentOffset(CGPoint.zero, animated: true)
        } else if self.horScrollView.contentSize.width - button.frame.origin.x - button.frame.size.width * 0.5 < kScreenWidth * 0.5 {
            self.horScrollView.setContentOffset(CGPoint.init(x: self.horScrollView.contentSize.width - kScreenWidth, y: 0), animated: true)
        } else {
            self.horScrollView.setContentOffset(CGPoint.init(x: button.frame.origin.x + button.frame.size.width * 0.5 - kScreenWidth * 0.5, y: 0), animated: true)
        }
    }

}

// MARK: - Event(事件响应)
extension KeyboardBaseSampleController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc fileprivate func typeItemClick(_ itemView: UIButton) -> Void {
        if itemView == self.selectedItemView {
            return
        }
        self.processScrollView(itemView)
        self.view.endEditing(true)
        self.selectedItemView?.isSelected = false
        itemView.isSelected = true
        self.selectedItemView = itemView
        let index = itemView.tag - self.itemTagBase
        let item = self.items[index]
        self.inputField.keyboardType = item.type
        self.inputField.becomeFirstResponder()
    }
    
}

// MARK: - Enter Page
extension KeyboardBaseSampleController {
    
}

// MARK: - Notification
extension KeyboardBaseSampleController {
    
}

// MARK: - Extension Function
extension KeyboardBaseSampleController {
    
}

// MARK: - Delegate Function

// MARK: - <>
extension KeyboardBaseSampleController {
    
}

