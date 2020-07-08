//
//  IconControl.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/8.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  单icon的控件

import UIKit

/// 单icon的可点击Control
class IconControl: UIControl
{

    // MARK: - Internal Property

    //static var viewHeight: CGFloat = 44
    
    /// iconView
    let iconView: UIImageView = UIImageView()

    // MARK: - Private Property

    // MARK: - Initialize Function

    init() {
        super.init(frame: CGRect.zero)
        self.commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    /// 通用初始化
    fileprivate func commonInit() -> Void {
        self.initialUI()
        self.reLayout()
    }
}

// MARK: - Internal Function

extension IconControl {
    /// 重新布局，用于子类重写；若重写，则需移除内部控件的约束
    func reLayout() -> Void {

    }
}

// MARK: - Override Function

// MARK: - Private  UI
extension IconControl {
    /// 界面布局
    fileprivate func initialUI() -> Void {
        // 1. iconView
        self.addSubview(self.iconView)
        self.iconView.set(cornerRadius: 0)
        self.iconView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - Private  数据(处理 与 加载)

// MARK: - Private  事件
