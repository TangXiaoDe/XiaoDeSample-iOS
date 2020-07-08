//
//  UIViewController+Extension.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/8.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  UIViewController的扩展

import Foundation
import UIKit

extension UIViewController
{
    /// 底部控制器
    var topVC: UIViewController {
        var topVC: UIViewController = self
        if let presendVC = self.presentedViewController {
            topVC = presendVC
        } else if let tabVC = self as? UITabBarController, let selectedVC = tabVC.selectedViewController {
            topVC = selectedVC.topVC
        } else if let navVC = self as? UINavigationController, let lastVC = navVC.children.last {
            topVC = lastVC
        }
        return topVC
    }

}
