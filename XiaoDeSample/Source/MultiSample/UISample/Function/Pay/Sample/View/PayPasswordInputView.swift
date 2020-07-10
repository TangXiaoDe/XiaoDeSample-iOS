//
//  PayPasswordInputView.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/10.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  支付密码输入视图
//  支付密码输入控件——方框
//  注：输入的是6位纯数字

import UIKit

protocol PayPasswordInputViewProtocol: class {
    /// 密码改变的回调
    func pwdInputView(_ pwdInputView: PayPasswordInputView, didPasswordChanged password: String) -> Void
}

class PayPasswordInputView: UIView
{

    // MARK: - Internal Property

    let count: Int = 6  // 最大位数
    let viewWidth: CGFloat
    let spacing: CGFloat = 0

    var secureTextEntry: Bool = true {
        didSet {
            for itemView in self.itemViewList {
                itemView.secureTextEntry = secureTextEntry
            }
        }
    }

    var password: String? {
        get {
            return self.textField.text
        }
        set {
            self.textField.text = newValue
            self.textFieldValueChanged(self.textField)
        }
    }
    func clear() -> Void {
        self.password = nil
    }

    var isFinish: Bool {
        var flag: Bool = false
        guard let password = self.password else {
            return flag
        }
        flag = password.count == self.count
        return flag
    }

    /// 代理
    weak var delegate: PayPasswordInputViewProtocol?

    // MARK: - Private Property

    let textField: UITextField = UITextField()
    fileprivate var itemViewList: [PayPasswordInputItemView] = []

    // MARK: - Initialize Function
    init(width: CGFloat) {
        self.viewWidth = width
        super.init(frame: CGRect.zero)
        self.initialUI()
    }
    required init?(coder aDecoder: NSCoder) {
        //super.init(coder: aDecoder)
        //self.initialUI()
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LifeCircle Function

    // MARK: - Override Function

    override func becomeFirstResponder() -> Bool {
        return self.textField.becomeFirstResponder()
    }

}

// MARK: - Internal Function

// MARK: - Private  UI
extension PayPasswordInputView {

    // 界面布局
    fileprivate func initialUI() -> Void {
        // 1. 添加textField
        self.addSubview(textField)
        textField.isHidden = true
        textField.addTarget(self, action: #selector(textFieldValueChanged(_:)), for: .editingChanged)
        textField.delegate = self
        textField.keyboardType = .decimalPad
        textField.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        // 2. 添加inputItem
        let itemW: CGFloat = (self.viewWidth - self.spacing * CGFloat(self.count - 1)) / CGFloat(self.count)
        var leftView: UIView = self
        for index in 0..<count {
            let itemView = PayPasswordInputItemView()
            self.addSubview(itemView)
            self.itemViewList.append(itemView)
            itemView.secureTextEntry = self.secureTextEntry
            itemView.snp.makeConstraints({ (make) in
                make.width.equalTo(itemW)
                make.top.bottom.equalTo(self)
                if 0 == index {
                    make.leading.equalToSuperview()
                } else {
                    // 如果间距为0时前后都有分隔线，会加宽交接处线条
                    //make.leading.equalTo(leftView.snp.trailing).offset(-1)
                    make.leading.equalTo(leftView.snp.trailing).offset(self.spacing)
                }
            })
            leftView = itemView
        }
        self.bringSubviewToFront(textField)
    }

}

// MARK: - Data Function

extension PayPasswordInputView {

}

// MARK: - Event Function

extension PayPasswordInputView {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //super.touchesBegan(touches, with: event)
        self.textField.becomeFirstResponder()
    }

    @objc fileprivate func textFieldValueChanged(_ textField: UITextField) -> Void {
        guard let text = textField.text else {
            return
        }
        let currentLen = text.count
        for index in 0..<self.count {
            let itemView = self.itemViewList[index]
            if index < currentLen {
                itemView.content = text.subString(with: NSRange(location: index, length: 1))
            } else {
                itemView.content = nil
            }
        }
        self.delegate?.pwdInputView(self, didPasswordChanged: text)
    }

}

// MARK: - Extension Function

// MARK: - <UITextFieldDelegate>
extension PayPasswordInputView: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var shouldFlag: Bool = true
        // 纯数字判断
        if !string.isEmpty {
            if nil == Int(string) {
                shouldFlag = false
            }
        }
        // 长度判断
        if range.location >= self.count {
            shouldFlag = false
        }
        return shouldFlag
    }

}
