//
//  ProjectManager.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/6/2.
//  Copyright © 2020 XiaoDe. All rights reserved.
//
//  项目管理 - 可切换项目

import Foundation
import UIKit

enum ProjectType {
    /// 项目管理器
    case projectmanage
    /// XD浏览器
    case xdbrowser
}

class ProjectItemModel
{
    let mainVC: UIViewController
    let type: ProjectType

    init(type: ProjectType, mainVC: UIViewController) {
        self.type = type
        self.mainVC = mainVC
    }
    
}


/// 项目管理
class ProjectManager
{
    static let share = ProjectManager.init()
    fileprivate init() {
    }
    
    /// 项目切换
    func swithProject(_ project: ProjectItemModel) -> Void {
        RootManager.share.type = .custom(rootVC: project.mainVC)
    }
    

}

