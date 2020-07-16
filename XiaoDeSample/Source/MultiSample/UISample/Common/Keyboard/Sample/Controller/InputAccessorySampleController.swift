//
//  InputAccessorySampleController.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/15.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//

import UIKit

typealias KeyboardAccessorySampleController = InputAccessorySampleController
class InputAccessorySampleController: BaseViewController
{
    // MARK: - Internal Property
    
    // MARK: - Private Property
    
    fileprivate let accountField: UITextField = UITextField.init()
    fileprivate let nameField: UITextField = UITextField.init()
    
    fileprivate let myInputAccessoryView: CommonInputAccessoryView = CommonInputAccessoryView.init()
    
    fileprivate let lrMargin: CGFloat = 15
    
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
extension InputAccessorySampleController {
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
extension InputAccessorySampleController {
    /// 页面布局
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = AppColor.pageBg
        // navbar
        self.navigationItem.title = "InputAccessory"
        // accountField
        self.view.addSubview(self.accountField)
        self.accountField.set(placeHolder: nil, text: nil, font: UIFont.pingFangSCFont(size: 15), textColor: UIColor.init(hex: 0x333333), alignment: .left)
        self.accountField.setPlaceHolder("请输入账号", font: UIFont.pingFangSCFont(size: 15), color: UIColor.init(hex: 0xaaaaaa))
        self.accountField.backgroundColor = UIColor.white
        self.accountField.set(cornerRadius: 5)
        self.accountField.leftView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 15, height: 1))
        self.accountField.leftViewMode = .always
        self.accountField.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(self.lrMargin)
            make.trailing.equalToSuperview().offset(-self.lrMargin)
            make.top.equalToSuperview().offset(25)
            make.height.equalTo(35)
        }
        // inputAccessoryView
        self.myInputAccessoryView.bounds = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 44)
        self.myInputAccessoryView.delegate = self
        self.accountField.inputAccessoryView = self.myInputAccessoryView
        // nameField
        self.view.addSubview(self.nameField)
        self.nameField.set(placeHolder: nil, text: nil, font: UIFont.pingFangSCFont(size: 15), textColor: UIColor.init(hex: 0x333333), alignment: .left)
        self.nameField.setPlaceHolder("请输入姓名", font: UIFont.pingFangSCFont(size: 15), color: UIColor.init(hex: 0xaaaaaa))
        self.nameField.backgroundColor = UIColor.white
        self.nameField.set(cornerRadius: 5)
        self.nameField.leftView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 15, height: 1))
        self.nameField.leftViewMode = .always
        self.nameField.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(self.lrMargin)
            make.trailing.equalToSuperview().offset(-self.lrMargin)
            make.top.equalTo(self.accountField.snp.bottom).offset(25)
            make.height.equalTo(35)
        }
        // inputAccessoryView
        //self.nameField.inputAccessoryView = self.myInputAccessoryView
    }
    
}

// MARK: - Data(数据处理与加载)
extension InputAccessorySampleController {
    /// 默认数据加载
    fileprivate func initialDataSource() -> Void {
        
    }
    
}

// MARK: - Event(事件响应)
extension InputAccessorySampleController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

// MARK: - Enter Page
extension InputAccessorySampleController {
    
}

// MARK: - Notification
extension InputAccessorySampleController {
    
}

// MARK: - Extension Function
extension InputAccessorySampleController {
    
}

// MARK: - Delegate Function

// MARK: - <CommonInputAccessoryViewProtocol>
extension InputAccessorySampleController: CommonInputAccessoryViewProtocol {
    /// 关闭按钮点击回调
    func accessoryView(_ accessoryView: CommonInputAccessoryView, didClickedClose closeBtn: UIButton) -> Void {
        self.view.endEditing(true)
    }

}


