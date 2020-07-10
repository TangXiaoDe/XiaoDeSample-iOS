//
//  PayPasswordInputItemView.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/10.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  方框密码输入item视图——四周都有边框

import UIKit

class PayPasswordInputItemView: UIView
{

    fileprivate let bgView: UIImageView = UIImageView()
    fileprivate let titleLabel: UILabel = UILabel()
    fileprivate let imageView: UIImageView = UIImageView()

    var secureTextEntry: Bool = true {
        didSet {
            self.titleLabel.isHidden = secureTextEntry
            self.imageView.isHidden = !secureTextEntry
        }
    }

    var content: String? {
        didSet {
            self.titleLabel.text = content
            if content == nil || content!.isEmpty {
                self.imageView.image = nil
            } else {
                self.imageView.image = UIImage.imageWithColor(UIColor(hex: 0x2d2d2d))
            }
        }
    }

    init() {
        super.init(frame: CGRect.zero)
        self.initialUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func initialUI() -> Void {
        // 1. bgView
        self.addSubview(bgView)
        self.bgView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        // 2. titleLabel
        self.addSubview(titleLabel)
        titleLabel.set(text: nil, font: UIFont.systemFont(ofSize: 18), textColor: UIColor(hex: 0x2d2d2d), alignment: .center)
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
            make.center.equalTo(self)
        }
        // 3. imageView
        let iconWH: CGFloat = 10
        self.addSubview(imageView)
        imageView.set(cornerRadius: iconWH * 0.5)
        imageView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.width.height.equalTo(iconWH)
        }

        // 4. line
        _ = self.addLineWithSide(.inBottom, color: UIColor(hex: 0x999999), thickness: 1, margin1: 0, margin2: 0)
        _ = self.addLineWithSide(.inTop, color: UIColor(hex: 0x999999), thickness: 1, margin1: 0, margin2: 0)
        _ = self.addLineWithSide(.inLeft, color: UIColor(hex: 0x999999), thickness: 1, margin1: 0, margin2: 0)
        _ = self.addLineWithSide(.inRight, color: UIColor(hex: 0x999999), thickness: 1, margin1: 0, margin2: 0)
    }

}
