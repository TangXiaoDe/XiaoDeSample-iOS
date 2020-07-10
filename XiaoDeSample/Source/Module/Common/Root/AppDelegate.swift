//
//  AppDelegate.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/6/3.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.appSetup(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

// MARK: - setup
extension AppDelegate {
    /// app设置
    fileprivate func appSetup(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Void {
//        self.justTest()
//        // 数据库配置
//        self.setupDataBase()
//        // 网络请求
//        self.setupNetwork()
//        /// 分享配置(使用MonkeyKing)
//        self.setupShareConfig()
//        // 图片缓存设置
//        self.setupImageCache()
//        // 广告
//        self.setupAdvert()
//        /// 应用启动配置(来自服务器)
//        self.setupAppLaunchConfig()
//        /// UM配置
//        self.setupUMeng()
//        /// 崩溃收集
//        self.setupCrash()
//        /// 极光推送配置
//        self.setupJPush(didFinishLaunchingWithOptions: launchOptions)
        // 应用UI配置
        self.setupAppUI()
        // 根控
        self.setupRootVC()
//        // 远程通知启动
//        self.remoteNotificationLaunchProcess(launchOptions)
//        /// 环信配置
//        self.setupEaseMob()
//        /// 地图配置
//        self.setupMap()
    }
    
    /// 根控加载
    fileprivate func setupRootVC() -> Void {
        let rootVC = RootManager.share.rootVC
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = rootVC
        window.makeKeyAndVisible()
        self.window = window
    }
    
    /// 应用UI配置
    fileprivate func setupAppUI() -> Void {
        // navigationBar配置 - 同步(必须同步而不是异步，否则默认展示的导航控制器会显示异常)
        let titleFont: UIFont = UIFont.pingFangSCFont(size: 18, weight: .medium)
        UINavigationController.setNavBarTheme(titleFont: titleFont, titleColor: UIColor.white, tintColor: UIColor.white, barTintColor: UIColor.init(hex: 0x2D385C), isTranslucent: false, bgImage: UIImage(), shadowColor: UIColor.init(hex: 0x202A46))

        /// 该类初始化之后，配置整个应用: 主题色等 - 异步
        DispatchQueue.main.async {
            // input
            //UITextField.appearance().tintColor = TSColor.main.theme
            //UITextView.appearance().tintColor = TSColor.main.theme
            // button
            UIButton.appearance().isExclusiveTouch = true
            UIControl.appearance().isExclusiveTouch = true
            // UITabBarItem
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.pingFangSCFont(size: 10, weight: .medium), NSAttributedString.Key.foregroundColor: UIColor.init(hex: 0x8C97AC)], for: .normal)
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.pingFangSCFont(size: 10, weight: .medium), NSAttributedString.Key.foregroundColor: AppColor.theme], for: .selected)
        }
        UIApplication.shared.statusBarStyle = .lightContent
        // 解决Tabbar中pusha再pop时有自定义导航栏的界面tabbar跳动的问题
        UITabBar.appearance().isTranslucent = false
    }

    
    
}


