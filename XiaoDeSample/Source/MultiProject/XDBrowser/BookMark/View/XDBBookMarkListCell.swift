//
//  XDBBookMarkListCell.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/6/3.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  书签列表Cell

import UIKit

/// 书签列表Cell
class XDBBookMarkListCell: UITableViewCell
{
    
    // MARK: - Internal Property
    static let cellHeight: CGFloat = 50
    /// 重用标识符
    static let identifier: String = "XDBBookMarkListCellReuseIdentifier"
    
    var indexPath: IndexPath?
    var model: XDBBookMarkModel? {
        didSet {
            self.setupWithModel(model)
        }
    }
    var showBottomLine: Bool = true  {
        didSet {
            self.bottomLine.isHidden = !showBottomLine
        }
    }
    
    // MARK: - fileprivate Property
    
    let mainView: UIView = UIView()
    let iconView: UIImageView = UIImageView.init()
    let titleLabel: UILabel = UILabel.init()
    let bottomLine: UIView = UIView.init()
    
    fileprivate let iconWH: CGFloat = 22
    fileprivate let lrMargin: CGFloat = 12
    fileprivate let iconTitleHorMargin: CGFloat = 10
    
    // MARK: - Initialize Function
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    /// 通用初始化：UI、配置、数据等
    fileprivate func commonInit() -> Void {
        self.initialUI()
    }
    
}

// MARK: - Internal Function
extension XDBBookMarkListCell {
    /// 便利构造方法
    class func cellInTableView(_ tableView: UITableView, at indexPath: IndexPath? = nil) -> XDBBookMarkListCell {
        let identifier = XDBBookMarkListCell.identifier
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if nil == cell {
            cell = XDBBookMarkListCell.init(style: .default, reuseIdentifier: identifier)
        }
        // 状态重置
        if let cell = cell as? XDBBookMarkListCell {
            cell.resetSelf()
            cell.indexPath = indexPath
        }
        return cell as! XDBBookMarkListCell
    }

}

// MARK: - Override Function
extension XDBBookMarkListCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}

// MARK: - UI 界面布局
extension XDBBookMarkListCell {
    // 界面布局
    fileprivate func initialUI() -> Void {
        // mainView - 整体布局，便于扩展，特别是针对分割、背景色、四周间距
        self.contentView.addSubview(mainView)
        self.initialMainView(self.mainView)
        mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    // 主视图布局
    fileprivate func initialMainView(_ mainView: UIView) -> Void {
        mainView.backgroundColor = UIColor.white
        // 1. iconView
        mainView.addSubview(self.iconView)
        self.iconView.set(cornerRadius: self.iconWH * 0.5)
        self.iconView.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.iconWH)
            make.leading.equalToSuperview().offset(self.lrMargin)
            make.centerY.equalToSuperview()
        }
        // 2. titleLabel
        mainView.addSubview(self.titleLabel)
        self.titleLabel.set(text: nil, font: UIFont.pingFangSCFont(size: 14, weight: .medium), textColor: UIColor.init(hex: 0x333333))
        self.titleLabel.numberOfLines = 2
        self.titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.iconView.snp.trailing).offset(self.iconTitleHorMargin)
            make.trailing.equalToSuperview().offset(-self.lrMargin)
            make.centerY.equalToSuperview()
        }
        // 3. bottomLine
        mainView.addSubview(self.bottomLine)
        self.bottomLine.backgroundColor = AppColor.dividing
        self.bottomLine.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.leading.equalToSuperview().offset(self.lrMargin)
            make.trailing.equalToSuperview().offset(-self.lrMargin)
        }
    }

}

// MARK: - Data 数据加载
extension XDBBookMarkListCell {
    /// 重置
    fileprivate func resetSelf() -> Void {
        self.selectionStyle = .none
    }
    /// 数据加载
    fileprivate func setupWithModel(_ model: XDBBookMarkModel?) -> Void {
        guard let model = model else {
            return
        }
        self.iconView.kf.setImage(with: model.iconUrl, placeholder: AppImage.PlaceHolder.icon)
        self.titleLabel.text = model.title
    }

}

// MARK: - Event  事件响应
extension XDBBookMarkListCell {
    
}

