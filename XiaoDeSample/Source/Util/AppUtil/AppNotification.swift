//
//  AppNotification.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/5/25.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  通知命名的统一管理

import Foundation

typealias AppNotification = Notification.Name
typealias AppNotificationName = Notification.Name
extension Notification.Name
{

    /// Tabbar跳转
    struct Tabbar {
        /// iMeet
        static let imeet = NSNotification.Name(rawValue: "app.notification.name.tabbar.imeet")
        /// 遇见
        static let meet = NSNotification.Name(rawValue: "app.notification.name.tabbar.meet")
        /// 广场
        static let square = NSNotification.Name(rawValue: "app.notification.name.tabbar.square")
        /// 任务
        static let task = NSNotification.Name(rawValue: "app.notification.name.tabbar.task")
        /// 挖矿
        static let mining = NSNotification.Name(rawValue: "app.notification.name.tabbar.mining")
        /// 星球
        static let planet = NSNotification.Name(rawValue: "app.notification.name.tabbar.planet")
    }


    /// 广告
    struct Advert {
        static let click = NSNotification.Name(rawValue: "app.notification.name.advert.click")
    }

    /// 推送
    struct APNS {
        /// 推送点击
        static let click = NSNotification.Name(rawValue: "app.notification.name.apns.click")
        /// 推送启动
        static let launch = NSNotification.Name(rawValue: "app.notification.name.apns.launch")
    }

    /// App - App进入前台和后台都有系统通知
    struct App {
        /// 进入后台
        static let enterBackground = NSNotification.Name(rawValue: "app.notification.name.app.enterbackground")
        /// 进入前台
        static let enterForeground = NSNotification.Name(rawValue: "app.notification.name.app.enterforeground")

        /// 显示左侧弹窗
        static let showLeftMenu = NSNotification.Name(rawValue: "app.notification.name.app.showleftmenu")

        /// 获取系统配置
        static let getSystemConfig = NSNotification.Name(rawValue: "app.notification.name.app.getsystemconfig")
    }

    /// 邀请
    struct Invite {
        /// 一级好友点击
        static let firstFriendTap = NSNotification.Name(rawValue: "app.notification.name.invite.firstfriendtap")
    }

    /// 支付
    struct Pay {
        /// 支付宝支付成功
        static let alipaySuccess = NSNotification.Name(rawValue: "app.notification.name.pay.alipaysuccess")
        /// 微信支付成功
        static let wechatPaySuccess = NSNotification.Name(rawValue: "app.notification.name.pay.wechatpaysuccess")
    }
    
    /// 支付密码
    struct PayPwd {
        /// 重置成功
        static let resetSuccess = NSNotification.Name(rawValue: "app.notification.name.paypwd.resetsuccess")
    }



}
