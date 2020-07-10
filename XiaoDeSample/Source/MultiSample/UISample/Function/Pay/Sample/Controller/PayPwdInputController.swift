//
//  PayPwdInputController.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/10.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  支付密码输入界面

import UIKit

class PayPwdInputController: BaseViewController
{
    // MARK: - Internal Property
    
    // MARK: - Private Property
    
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
extension PayPwdInputController {
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
extension PayPwdInputController {
    /// 页面布局
    fileprivate func initialUI() -> Void {
        self.view.backgroundColor = UIColor.white
        // navbar
        self.navigationItem.title = "PayPwdInput"
    }

}

// MARK: - Data(数据处理与加载)
extension PayPwdInputController {
    /// 默认数据加载
    fileprivate func initialDataSource() -> Void {
        
    }

}

// MARK: - Event(事件响应)
extension PayPwdInputController {
    
}

// MARK: - Enter Page
extension PayPwdInputController {
    
}

// MARK: - Notification
extension PayPwdInputController {
    
}

// MARK: - Extension Function
extension PayPwdInputController {
    
}

// MARK: - Delegate Function

// MARK: - <>
extension PayPwdInputController {
    
}

