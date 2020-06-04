//
//  SampleManager.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/6/4.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  Sample管理

import Foundation
import UIKit

enum SampleType {
    /// RxSwift
    case rxsiwft
    /// SwiftUI
    case swiftui
    /// LeftMenuRightMenu
    case lrmenu
}

class SampleItemModel
{
    let mainVC: UIViewController
    let type: SampleType

    init(type: SampleType, mainVC: UIViewController) {
        self.type = type
        self.mainVC = mainVC
    }
    
}

class SampleManager
{
    static let share = SampleManager.init()
    fileprivate init() {
    }
    
    /// Sample切换
    func swithSample(_ sample: SampleItemModel) -> Void {
        RootManager.share.type = .custom(rootVC: sample.mainVC)
    }
    

}

