//
//  TitleControl.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/8.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  单Title的点击控件

import UIKit

typealias SingleTitleControl = TitleControl
/// 单Title的点击控件
class TitleControl: UIControl
{

    // MARK: - Internal Property

    //static var viewHeight: CGFloat = 44
    
    /// titleLabel
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
    fileprivate func commonInit() -> Void {
        self.initialUI()
    }
}

// MARK: - Internal Function

// MARK: - Override Function

// MARK: - Private  UI
extension TitleControl {
    /// 界面布局
    fileprivate func initialUI() -> Void {
        // 1. label
        self.addSubview(self.label)
        self.label.set(text: nil, font: UIFont.systemFont(ofSize: 14), textColor: UIColor.darkText)
        self.label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}

// MARK: - Private  数据(处理 与 加载)

// MARK: - Private  事件
