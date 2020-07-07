//
//  UserSupplement.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/5/26.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  用户补充

import Foundation
import UIKit
import ObjectMapper

/// 用户认证状态
enum UserCertificationStatus: String
{
    /// 未认证
    case unCertified = "unCertified"
    /// 审核中
    case waiting = "waiting"
    /// 认证失败
    case failure = "failure"
    /// 已认证 - 认证成功
    case certified = "certified"

    var title: String {
        var title: String = ""
        switch self {
        case .unCertified:
            title = "未认证"
        case .waiting:
            title = "审核中"
        case .failure:
            title = "认证失败"
        case .certified:
            title = "已认证"
        }
        return title
    }

}

/// 用户性别
enum UserSex: Int
{
    /// 未知
    case unknown = 0
    /// 男
    case man = 1
    /// 女
    case woman = 2

    /// 性别描述
    var title: String {
        var desc: String = ""
        switch self {
        case .unknown:
            desc = "保密"
        case .man:
            desc = "男"
        case .woman:
            desc = "女"
        }
        return desc
    }

    /// 他她它
    var ta: String {
        var desc: String = ""
        switch self {
        case .unknown:
            desc = "它"
        case .man:
            desc = "他"
        case .woman:
            desc = "她"
        }
        return desc
    }

    /// 图标
    var icon: UIImage? {
        var image: UIImage? = nil
        switch self {
        case .unknown:
            image = self.placeholder
        case .man:
            image = UIImage.init(named: "IMG_icon_sex_men")
        case .woman:
            image = UIImage.init(named: "IMG_icon_sex_women")
        }
        return image
    }
    /// 占位图
    var placeholder: UIImage? {
        var image: UIImage? = AppImage.PlaceHolder.user_secrecy
        switch self {
        case .unknown:
            image = AppImage.PlaceHolder.user_secrecy
        case .man:
            image = AppImage.PlaceHolder.user_man
        case .woman:
            image = AppImage.PlaceHolder.user_woman
        }
        return image
    }

}

