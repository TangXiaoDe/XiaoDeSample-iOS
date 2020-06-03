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
//        // 应用UI配置
//        self.setupAppUI()
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
        //let rootVC = RootManager.share.rootVC
        let rootVC = ViewController.init()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = rootVC
        window.makeKeyAndVisible()
        self.window = window
    }
    
    
}


