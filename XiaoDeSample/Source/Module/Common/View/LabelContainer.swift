//
//  LabelContainer.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/5/9.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  封装UILabel的UIView

import UIKit

class LabelContainer: UIView
{

    // MARK: - Internal Property

    let label: UILabel = UILabel()

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
extension LabelContainer {

}

// MARK: - Override Function

// MARK: - Private  UI
extension LabelContainer {
    /// 界面布局
    fileprivate func initialUI() -> Void {
        // 1. label
        self.addSubview(self.label)
        self.label.set(text: nil, font: UIFont.systemFont(ofSize: 14), textColor: UIColor.lightGray)
        self.label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}

// MARK: - Private  数据(处理 与 加载)

// MARK: - Private  事件
