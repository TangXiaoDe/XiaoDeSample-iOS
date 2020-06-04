//
//  AppManager.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/6/2.
//  Copyright © 2020 XiaoDe. All rights reserved.
//
//  应用管理 - 可切换应用

import Foundation
import UIKit

enum AppType {
    /// 应用管理器
    case appmanage
    /// XD浏览器
    case xdbrowser
    /// XD项目管理
    case projectmanage
}

class AppItemModel
{
    let mainVC: UIViewController
    let type: AppType

    init(type: AppType, mainVC: UIViewController) {
        self.type = type
        self.mainVC = mainVC
    }
    
}


/// 项目管理
class AppManager
{
    static let share = AppManager.init()
    fileprivate init() {
    }
    
    /// 项目切换
    func swithApp(_ app: AppItemModel) -> Void {
        RootManager.share.type = .custom(rootVC: app.mainVC)
    }
    

}

