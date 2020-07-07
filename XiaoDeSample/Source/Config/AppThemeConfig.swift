//
//  AppThemeConfig.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2019/5/30.
//  Copyright © 2019 XiaoDeSample. All rights reserved.
//
//  App主题配置：颜色、图片、


import Foundation
import UIKit

/// App主题分类
enum AppThemeType
{
    case `default`
    case light
    case dark
}

/// App主题配置
fileprivate class AppThemeConfig
{
    static let `default`: [String: Int] = ["theme": 0x6EEEFC, "minor": 0x2D385C]
    static let light: [String: Int] = AppThemeConfig.default
    static let dark: [String: Int] = AppThemeConfig.default
}

/// App主题模型
class AppThemeModel
{

    static let `default`: AppThemeModel = AppThemeModel.init(type: .default)
    static let light: AppThemeModel = AppThemeModel.init(type: .light)
    static let dark: AppThemeModel = AppThemeModel.init(type: .dark)

    init(type: AppThemeType) {
        switch type {
        case .default:
            self.loadTheme(AppThemeConfig.default)
        case .light:
            self.loadTheme(AppThemeConfig.light)
        case .dark:
            self.loadTheme(AppThemeConfig.dark)
        }
    }

    /// 主题加载
    fileprivate func loadTheme(_ config: [String: Int]) -> Void {
        self.themeColor = UIColor.init(hex: config["theme"] ?? 0x6EEEFC)
        self.minorColor = UIColor.init(hex: config["minor"] ?? 0x2D385C)
    }

    /// 主题色
    var themeColor: UIColor = UIColor.init(hex: 0x6EEEFC)
    /// 辅助色/次要色 - 跟主题色接近但又不同，作为主题色的补充
    var minorColor: UIColor = UIColor.init(hex: 0x2D385C)

    /// 导航栏背景色
    var navBgColor: UIColor = UIColor.init(hex: 0x2D385C)
    /// 导航栏标题色
    var navTitleColor: UIColor = UIColor.init(hex: 0xFFFFFF)
    /// 导航栏item颜色
    var navItemColor: UIColor = UIColor.init(hex: 0xFFFFFF)

    /// 标签栏背景色
    var tabBgColor: UIColor = UIColor.init(hex: 0x2D385C)
    /// 标签栏未选中色
    var tabUnSelectedColor: UIColor = UIColor.init(hex: 0x8C97AC)
    /// 标签栏选中色
    var tabSelectedColor: UIColor = UIColor.init(hex: 0x6EEEFC)
    
    /// 分割线颜色
    var dividingColor: UIColor = UIColor.init(hex: 0x35426A)

    /// 标题色(页面)
    var titleColor: UIColor = UIColor.white
    /// 正文颜色
    var mainTextColor: UIColor = UIColor.white
    /// 详情颜色
    var detailTextColor: UIColor = UIColor.white

    /// 页面背景色(占位色)
    var pageBgColor: UIColor = UIColor.init(hex: 0x202A46)
    /// 图片背景色(占位色)
    var imgBgColor: UIColor = UIColor.init(hex: 0x000000).withAlphaComponent(0.3)

    /// 不可用颜色
    var disableColor: UIColor = UIColor.init(hex: 0x35426A)
    /// 文字不可用颜色
    var disableTitleColor: UIColor = UIColor.init(hex: 0x8C97AC)

    /// 输入框背景色
    var inputBgColor: UIColor = UIColor.init(hex: 0x202A46)
    /// 输入框PlaceHolder文字颜色
    var inputPlaceColor: UIColor = UIColor.init(hex: 0x525C6E)

}
