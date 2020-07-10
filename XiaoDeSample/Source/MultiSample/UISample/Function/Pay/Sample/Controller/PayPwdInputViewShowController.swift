//
//  PayPwdInputViewShowController.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/10.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  支付密码输入视图展示界面

import UIKit

class PayPwdInputViewShowController: BaseViewController
{
    // MARK: - Internal Property
    
    // MARK: - Private Property
    
    fileprivate let pwdInputView: PayPasswordInputView = PayPasswordInputView.init(width: kScreenWidth - 24.0)
    
    fileprivate let lrMargin: CGFloat = 12
    
    
    
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
extension PayPwdInputViewShowController {
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
extension PayPwdInputViewShowController {
    /// 页面布局
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // navbar
        self.navigationItem.title = "PayPwdInputView"
        // pwdInputView
        self.view.addSubview(self.pwdInputView)
        self.pwdInputView.backgroundColor = UIColor.random
        self.pwdInputView.secureTextEntry = true
        self.pwdInputView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(self.lrMargin)
            make.trailing.equalToSuperview().offset(-self.lrMargin)
            make.bottom.equalToSuperview().offset(-350)
            make.height.equalTo(44)
        }
        
    }

}

// MARK: - Data(数据处理与加载)
extension PayPwdInputViewShowController {
    /// 默认数据加载
    fileprivate func initialDataSource() -> Void {
        
    }

}

// MARK: - Event(事件响应)
extension PayPwdInputViewShowController {
    
}

// MARK: - Enter Page
extension PayPwdInputViewShowController {
    
}

// MARK: - Notification
extension PayPwdInputViewShowController {
    
}

// MARK: - Extension Function
extension PayPwdInputViewShowController {
    
}

// MARK: - Delegate Function

// MARK: - <>
extension PayPwdInputViewShowController {
    
}

