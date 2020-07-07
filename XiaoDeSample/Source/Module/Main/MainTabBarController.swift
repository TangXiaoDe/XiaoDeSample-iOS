//
//  MainTabBarController.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/6/2.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  主界面

import UIKit
import Reachability

class MainTabBarController: UITabBarController
{
    // MARK: - Internal Property

    // MARK: - Private Property
    fileprivate var items: [TabbarItemModel] = []

    fileprivate var lastDate = Date.init()


    // MARK: - Initialize Function

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - Internal Function
extension MainTabBarController {

}

// MARK: - LifeCircle Function
extension MainTabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.initialUI()
        self.initialDataSource()
        // 通知添加
        NotificationCenter.default.addObserver(self, selector: #selector(notificationProcess(_:)), name: NSNotification.Name.NetStatus.reachabilityChanged, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(notificationProcess(_:)), name: NSNotification.Name.Network.Illicit, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(notificationProcess(_:)), name: NSNotification.Name.Advert.click, object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

// MARK: - UI
extension MainTabBarController {
    /// 页面布局
    fileprivate func initialUI() -> Void {
//        self.view.backgroundColor = UIColor.white
//        // panGR
//        let panGR = UIPanGestureRecognizer.init(target: self, action: #selector(panGRProcess(_:)))
//        panGR.delegate = self
//        self.view.addGestureRecognizer(panGR)
    }
}

// MARK: - Data(数据处理与加载)
extension MainTabBarController {
    /// 默认数据加载
    fileprivate func initialDataSource() -> Void {
        // items
        let firstItem = TabbarItemModel(title: "tabbar.imeet".localized, normalImageName: "IMG_tabbar_icon_imeet_normal", selectedImageName: "IMG_tabbar_icon_imeet_selected", childVC: FirstHomeController.init())
        let secondItem = TabbarItemModel(title: "tabbar.meet".localized, normalImageName: "IMG_tabbar_icon_meet_normal", selectedImageName: "IMG_tabbar_icon_meet_selected", childVC: SecondHomeController.init())
        let thirdItem = TabbarItemModel(title: "tabbar.task".localized, normalImageName: "IMG_tabbar_icon_task_normal", selectedImageName: "IMG_tabbar_icon_task_select", childVC: ThirdHomeController.init())
        let fourthItem = TabbarItemModel(title: "tabbar.square".localized, normalImageName: "IMG_tabbar_icon_square_normal", selectedImageName: "IMG_tabbar_icon_square_selected", childVC: FourthHomeController.init())
        let fifthItem = TabbarItemModel(title: "tabbar.planet".localized, normalImageName: "IMG_tabbar_icon_planet_normal", selectedImageName: "IMG_tabbar_icon_planet_selected", childVC: FifthHomeController.init())
        if AppConfig.share.shield.currentNeedShield {
            self.items = [firstItem, secondItem, thirdItem, fifthItem]
        } else {
            self.items = [firstItem, secondItem, thirdItem, fourthItem, fifthItem]
        }
        self.setupChildControllers()
    }

    /// 加载子控制器
    fileprivate func setupChildControllers() -> Void {
        // customTabbar
        let customTabbar: BaseTabBar = BaseTabBar()
        customTabbar.barTintColor = UIColor.init(hex: 0x2D385C)
        self.setValue(customTabbar, forKey: "tabBar")
        // childs
        var childVCList: [UIViewController] = []
        for item in items {
            let childNC = self.packChildVC(item.childVC, title: item.title, normalImage: item.normalImage, selectedImage: item.selectedImage)
            childVCList.append(childNC)
        }
        // viewControllers 方式
        self.viewControllers = childVCList
        // addChildController方式 多次添加
        // self.addChildViewController(childNC)
        // 默认选中
        self.selectedIndex = 2
        // tabbar上item里的图文间距调整
        customTabbar.setTitleImageInsets(titlePositionOffset: UIOffset.init(horizontal: 0, vertical: -2), imageInsets: UIEdgeInsets.init(top: -1, left: 0, bottom: 1, right: 0))
    }

}

// MARK: - Event(事件响应)
extension MainTabBarController {
    //  触发转场动画，通过手势产生百分比数值，更新转场动画状态：
    @objc fileprivate func panGRProcess(_ panGR: UIPanGestureRecognizer) -> Void {
//        // 产生百分比
//        var progress = (panGR.translation(in: self.view).x + LeftMenuController.rightW) / kScreenWidth
//        progress = min(1.0, max(0.0, progress))
//        print("TestDismissInteractiveController panGRProcess translation \(panGR.translation(in: self.view))")
//        print("TestDismissInteractiveController panGRProcess \(progress)")
//        switch panGR.state {
//        case .began:
//            // 触发转场动画
//            self.showLeftMenu(interactive: true)
//        case .changed:
//            self.leftMenuPresentationController?.interactiveTransition?.update(progress)
//        case .ended:
//            fallthrough
//        case .cancelled:
//            // 位置有偏差
//            // panGR.translation(in: self.view).x > kScreenWidth * 0.5 + LeftMenuController.rightW
//            if progress > (0.5 + LeftMenuController.rightW * 0.5 / kScreenWidth ) {
//                self.leftMenuPresentationController?.interactiveTransition?.finish()
//            } else {
//                self.leftMenuPresentationController?.interactiveTransition?.cancel()
//            }
//            self.leftMenuPresentationController?.interactiveTransition = nil
//        default:
//            break
//        }
    }

}

// MARK: - sync data
extension MainTabBarController {

}

extension MainTabBarController {
    fileprivate func enterAdWebPage(link: String) -> Void {
        let webVC = XDWKWebViewController.init(type: XDWebViwSourceType.strUrl(strUrl: link))
        if let selectedNC = self.selectedViewController as? UINavigationController {
            selectedNC.pushViewController(webVC, animated: true)
        }
    }

}
// MARK: - Notification
extension MainTabBarController {

    @objc fileprivate func notificationProcess(_ notification: Notification) -> Void {
        switch notification.name {
        case AppNotification.Network.Illicit:
            self.authenticationIllicitNotificationProcess(notification)
        case AppNotification.Advert.click:
            self.advertClickNotificationProcess(notification)
        case AppNotification.NetStatus.reachabilityChanged:
            self.reachabilityChangedNotificationProcess(notification)
        case AppNotification.Tabbar.meet:
            self.tabbarSwitchNotificationProcess(notification)
        default:
            break
        }
    }

}

// MARK: - Extension Function
extension MainTabBarController {
    /// 包装子控制器成为导航控制器
    fileprivate func packChildVC(_ childVC: UIViewController, title: String, normalImage: UIImage?, selectedImage: UIImage?) -> UINavigationController {
        // 注：若tabBarItem.title不显示再tabbar上，确认下tabbarItem对应的VC是否直接是该VC，即是否使用NC包装；
        childVC.navigationItem.title = title
        let childNC: BaseNavigationController = BaseNavigationController(rootViewController: childVC)
        childNC.tabBarItem.title = title
        childNC.tabBarItem.image = normalImage?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        childNC.tabBarItem.selectedImage = selectedImage?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        childNC.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        return childNC
    }
    /// 设置子控制器
    fileprivate func setupChildVC(_ childVC: UIViewController, title: String, normalImage: UIImage?, selectedImage: UIImage?) -> Void {
        // 注：若tabBarItem.title不显示再tabbar上，确认下tabbarItem对应的VC是否直接是该VC，即是否使用NC包装；
        //childVC.title = title
        childVC.tabBarItem.title = title
        childVC.tabBarItem.image = normalImage?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        childVC.tabBarItem.selectedImage = selectedImage?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        childVC.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
    }
}

// MARK: - ShowAlert
extension MainTabBarController {

}

// MARK: - EnterPage
extension MainTabBarController {

}

// MARK: - extension
extension MainTabBarController {

}

// MARK: - delegate

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        let currentDate = Date.init()
//        let nav = tabBarController.selectedViewController as! BaseNavigationController
//        if let firstVC = nav.viewControllers.first, firstVC.isKind(of: MessageHomeController.self) && currentDate.timeIntervalSince1970 - self.lastDate.timeIntervalSince1970 <= 0.5 {
//            self.doubleSelectTabbar()
//        }
//        if let firstVC = nav.viewControllers.first, firstVC.isKind(of: MessageHomeController.self) {
//            self.lastDate = currentDate
//        }
    }

}

// MARK: - Timer & Looping
extension MainTabBarController {

}

// MARK: - Delegate Function

extension MainTabBarController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        var receiveFlag: Bool = false
        if let _ = gestureRecognizer as? UIPanGestureRecognizer, let selectedNC = self.selectedViewController as? UINavigationController {
            receiveFlag = selectedNC.children.count == 1
        }
        return receiveFlag
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        var receiveFlag: Bool = true
        if let panGR = gestureRecognizer as? UIPanGestureRecognizer {
            let velocity = panGR.velocity(in: self.view)
            if velocity.x > 0 {
                //  向右滑动
                receiveFlag = true
            } else {
                //  向左滑动
                receiveFlag = false
            }
        }
        return receiveFlag
    }

}
