//
//  CommonInputAccessoryView.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/16.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  通用的键盘辅助视图：右侧有一个关闭按钮，

import UIKit

protocol CommonInputAccessoryViewProtocol: class {
    /// 关闭按钮点击回调
    func accessoryView(_ accessoryView: CommonInputAccessoryView, didClickedClose closeBtn: UIButton) -> Void
}

/// 通用的键盘辅助视图
class CommonInputAccessoryView: UIView
{
    
    // MARK: - Internal Property
    
    weak var delegate: CommonInputAccessoryViewProtocol?
    var closeAction: ((_ accessoryView: CommonInputAccessoryView, _ closeBtn: UIButton) -> Void)?
    
    // MARK: - Private Property
    
    let mainView: UIView = UIView()
    let closeBtn: UIButton = UIButton.init(type: .custom)
    
    
    // MARK: - Initialize Function
    init() {
        super.init(frame: CGRect.zero)
        self.commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
        //fatalError("init(coder:) has not been implemented")
    }
    
    /// 通用初始化：UI、配置、数据等
    func commonInit() -> Void {
        self.initialUI()
    }
    
}

// MARK: - Internal Function
extension CommonInputAccessoryView {
    class func loadXib() -> CommonInputAccessoryView? {
        return Bundle.main.loadNibNamed("CommonInputAccessoryView", owner: nil, options: nil)?.first as? CommonInputAccessoryView
    }
}

// MARK: - LifeCircle Function
extension CommonInputAccessoryView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialInAwakeNib()
    }
    
    /// 布局子控件
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}
// MARK: - Private UI 手动布局
extension CommonInputAccessoryView {
    
    /// 界面布局
    fileprivate func initialUI() -> Void {
        self.addSubview(self.mainView)
        self.initialMainView(self.mainView)
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    fileprivate func initialMainView(_ mainView: UIView) -> Void {
        mainView.backgroundColor = UIColor.white
        // closeBtn
        mainView.addSubview(self.closeBtn)
        self.closeBtn.set(title: "关闭", titleColor: UIColor.init(hex: 0x333333), for: .normal)
        self.closeBtn.set(title: "关闭", titleColor: UIColor.init(hex: 0x333333), for: .highlighted)
        self.closeBtn.set(font: UIFont.pingFangSCFont(size: 14))
        self.closeBtn.contentEdgeInsets = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
        self.closeBtn.addTarget(self, action: #selector(closeBtnClick(_:)), for: .touchUpInside)
        self.closeBtn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-8)
        }
    }
    
}
// MARK: - Private UI Xib加载后处理
extension CommonInputAccessoryView {
    /// awakeNib时的处理
    fileprivate func initialInAwakeNib() -> Void {
        
    }
}

// MARK: - Data Function
extension CommonInputAccessoryView {
    /// 数据加载
    fileprivate func setupWithModel(_ model: String?) -> Void {
        guard let _ = model else {
            return
        }
        // 子控件数据加载
    }
    
}

// MARK: - Event Function
extension CommonInputAccessoryView {
    /// 关闭按钮点击响应
    @objc fileprivate func closeBtnClick(_ button: UIButton) -> Void {
        self.delegate?.accessoryView(self, didClickedClose: button)
        self.closeAction?(self, button)
    }

}

// MARK: - Extension Function
extension CommonInputAccessoryView {
    
}

// MARK: - Delegate Function

// MARK: - <XXXDelegate>
extension CommonInputAccessoryView {
    
}


