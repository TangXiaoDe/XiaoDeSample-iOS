//
//  AppFont.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/5/25.
//  Copyright © 2020 XiaoDe. All rights reserved.
//
//

import UIKit

/// 项目部分字体集合
class AppFont {

    static let navTitle: UIFont = UIFont.pingFangSCFont(size: 18, weight: .medium)
    static let navItem: UIFont = UIFont.pingFangSCFont(size: 15, weight: .medium)

}


extension UIFont {
    /// 平方字体
    class func pingFangSCFont(size: CGFloat, weight: UIFont.Weight = UIFont.Weight.regular) -> UIFont {

        var fontName: String = "PingFangSC-Regular"
        switch weight {
        case UIFont.Weight.regular:
            fontName = "PingFangSC-Regular"
        case UIFont.Weight.medium:
            fontName = "PingFangSC-Medium"
        case UIFont.Weight.light:
            fontName = "PingFangSC-Light"
        case UIFont.Weight.semibold:
            fontName = "PingFangSC-Semibold"
        case UIFont.Weight.bold:
            fontName = "PingFangSC-Bold"
        case UIFont.Weight.thin:
            fontName = "PingFangSC-Thin"
        case UIFont.Weight.ultraLight:
            fontName = "PingFangSC-UltraLight"
        default:
            break
        }
        let pingfangFont = UIFont.init(name: fontName, size: size)
        if let pingfangFont = pingfangFont {
            return pingfangFont
        }

        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
        return systemFont
    }

}


