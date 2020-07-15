//
//  KeyboardBaseSampleController.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/15.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//

import UIKit

class KeyboardBaseSampleController: BaseViewController
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
        // 
        
    }

}

// MARK: - Data(数据处理与加载)
extension KeyboardBaseSampleController {
    /// 默认数据加载
    fileprivate func initialDataSource() -> Void {
        
    }

}

// MARK: - Event(事件响应)
extension KeyboardBaseSampleController {
    
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

