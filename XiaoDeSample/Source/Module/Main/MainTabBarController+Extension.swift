//
//  MainTabBarController+Extension.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/6/2.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  主TabBar控制器的扩展文件
//  当TabBar中的非TabBar本身业务较多时应将其迁移到此，如通知、同步、请求等

import Foundation


// MARK: - DetailNotificationProcess
extension MainTabBarController
{
    
    /// 网络环境变更通知处理
    func reachabilityChangedNotificationProcess(_ notification: Notification) -> Void {
        print("MainTabBarController reachabilityChangedNotificationProcess")
        guard let conn = notification.object as? IMeetReachability.Connection else {
            return
        }
        switch conn {
        case .wifi:
            break
        case .cellular:
            break
        case .none:
            print("MainTabBarController reachabilityChangedNotificationProcess reach.connection none")
            // 提示网络设置
            //AppUtil.showNetworkSettingAlert()
        }
    }

    
    /// 401 token过期弹窗提示处理
    func authenticationIllicitNotificationProcess(_ notification: Notification) -> Void {
//        if RootManager.share.authIllicitAlertShowing {
//            return
//        }
//        AppUtil.logoutProcess(isAuthValid: false, isSwitchLogin: false)
//        RootManager.share.authIllicitAlertShowing = true
//        let title: String = "登录失效"
//        let alertVC = UIAlertController.init(title: title, message: nil, preferredStyle: .alert)
//        alertVC.addAction(UIAlertAction.init(title: "确定", style: .default, handler: { (action) in
//            RootManager.share.authIllicitAlertShowing = false
//            RootManager.share.switchRoot(.login)
//        }))
//        RootManager.share.topRootVC.present(alertVC, animated: true, completion: nil)
//        // 5秒之后如果弹窗还没未消失，则自动处理
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5.0) {
//            RootManager.share.authIllicitAlertShowing = false
//            alertVC.dismiss(animated: true, completion: {
//                RootManager.share.switchRoot(.login)
//            })
//        }
    }

    /// tabbar点击跳转
    func tabbarSwitchNotificationProcess(_ notification: Notification) -> Void {
        switch notification.name {
        case AppNotification.Tabbar.imeet:
            self.selectedIndex = 0
        case AppNotification.Tabbar.meet:
            self.selectedIndex = 1
        case AppNotification.Tabbar.square:
            self.selectedIndex = 2
        case AppNotification.Tabbar.mining:
            self.selectedIndex = 3
        case AppNotification.Tabbar.planet:
            self.selectedIndex = AppConfig.share.shield.currentNeedShield ? 3 : 4
        default:
            break
        }
    }

    /// 广告点击
    func advertClickNotificationProcess(_ notification: Notification) -> Void {
//        guard let model = notification.object as? AdvertModel else {
//            return
//        }
//        switch model.linkType {
//        case .outside:
//            self.enterAdWebPage(link: model.link)
//        case .inside:
//            break
//        default:
//            break
//        }
    }

}
