//
//  TitleValueControl.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/8.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  TitleValue的双Label控件
//  默认横向布局，根据需要自定义布局；
//  注1：用于取代DoubleTitleControl；

import UIKit

/// TitleValue的双Label的UIControl控件，默认横向加载，使用时需自定义布局
class TitleValueControl: UIControl
{

    // MARK: - Internal Property

    //static var viewHeight: CGFloat = 44

    /// titleLabel 标题控件，横向默认就是左边的，竖向默认就是上面的
    let titleLabel: UILabel = UILabel()
    /// valueLabel 值控件，横向默认就是右边的，竖向默认就是下面的
    let valueLabel: UILabel = UILabel()

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
extension TitleValueControl {
    /// 界面布局
    fileprivate func initialUI() -> Void {
        // 1. titleLabel
        self.addSubview(self.titleLabel)
        self.titleLabel.set(text: nil, font: UIFont.systemFont(ofSize: 14), textColor: UIColor.darkText)
        self.titleLabel.snp.makeConstraints { (make) in
            make.leading.centerY.equalToSuperview()
            make.top.greaterThanOrEqualToSuperview().offset(0)
            make.bottom.lessThanOrEqualToSuperview().offset(-0)
        }
        // 2. valueLabel
        self.addSubview(self.valueLabel)
        self.valueLabel.set(text: nil, font: UIFont.systemFont(ofSize: 14), textColor: UIColor.lightGray)
        self.valueLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.titleLabel.snp.trailing)
            make.centerY.trailing.equalToSuperview()
            make.top.greaterThanOrEqualToSuperview().offset(0)
            make.bottom.lessThanOrEqualToSuperview().offset(-0)
        }
    }
}

// MARK: - Private  数据(处理 与 加载)

// MARK: - Private  事件
