//
//  IconContainer.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/8.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  封装UIImageView的UIView

import UIKit

class IconContainer: UIView
{

    // MARK: - Internal Property

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
    func commonInit() -> Void {
        self.initialUI()
    }
}

// MARK: - Internal Function
extension IconContainer {

}

// MARK: - Override Function

// MARK: - Private  UI
extension IconContainer {
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
