//
//  XDProjectManageMainController.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/6/4.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  项目管理主界面

import UIKit

class XDProjectManageMainController: UITabBarController
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
extension XDProjectManageMainController {

}

// MARK: - LifeCircle Function
extension XDProjectManageMainController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.initialUI()
        self.initialDataSource()
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
extension XDProjectManageMainController {
    /// 页面布局
    fileprivate func initialUI() -> Void {

    }
}

// MARK: - Data(数据处理与加载)
extension XDProjectManageMainController {
    /// 默认数据加载
    fileprivate func initialDataSource() -> Void {
        // items
        let projectItem = TabbarItemModel(title: "项目".localized, normalImageName: "IMG_tabbar_icon_imeet_normal", selectedImageName: "IMG_tabbar_icon_imeet_selected", childVC: XDPProjectHomeController.init())
        let todoItem = TabbarItemModel(title: "TODO".localized, normalImageName: "IMG_tabbar_icon_meet_normal", selectedImageName: "IMG_tabbar_icon_meet_selected", childVC: XDPTodoHomeController.init())
        let mineItem = TabbarItemModel(title: "我的".localized, normalImageName: "IMG_tabbar_icon_meet_normal", selectedImageName: "IMG_tabbar_icon_meet_selected", childVC: XDPMineHomeController.init())
        self.items = [projectItem, todoItem, mineItem]
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
        self.selectedIndex = 1
        // tabbar上item里的图文间距调整
        customTabbar.setTitleImageInsets(titlePositionOffset: UIOffset.init(horizontal: 0, vertical: -2), imageInsets: UIEdgeInsets.init(top: -1, left: 0, bottom: 1, right: 0))
    }

}

// MARK: - Event(事件响应)
extension XDProjectManageMainController {


}

// MARK: - sync data
extension XDProjectManageMainController {

}

extension XDProjectManageMainController {

}
// MARK: - Notification
extension XDProjectManageMainController {


}

// MARK: - Extension Function
extension XDProjectManageMainController {
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
extension XDProjectManageMainController {

}

// MARK: - EnterPage
extension XDProjectManageMainController {

}

// MARK: - extension
extension XDProjectManageMainController {

}

// MARK: - delegate

extension XDProjectManageMainController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }

}

// MARK: - Timer & Looping
extension XDProjectManageMainController {

}

// MARK: - Delegate Function

