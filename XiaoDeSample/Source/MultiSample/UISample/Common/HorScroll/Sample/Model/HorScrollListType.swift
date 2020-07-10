//
//  HorScrollListType.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/7/8.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  HorScroll列表类型

import Foundation

enum HorScrollListType
{
    case follow     // 关注
    case recommend  // 推荐
    case nearby     // 附近
    case all        // 全部
    case topay      // 待付款
    case todeliver  // 待发货
    case toreceive  // 待收货
    case done       // 已完成
    case toreview   // 待审核
    case doing      // 进行中
    case passed     // 已通过
    case rejected   // 已拒绝

    var title: String {
        var title: String = ""
        switch self {
        case .follow:
            title = "关注"
        case .recommend:
            title = "推荐"
        case .nearby:
            title = "附近"
        case .all:
            title = "全部"
        case .topay:
            title = "待支付"
        case .todeliver:
            title = "待发货"
        case .toreceive:
            title = "待收货"
        case .done:
            title = "已完成"
        case .toreview:
            title = "待审核"
        case .doing:
            title = "进行中"
        case .passed:
            title = "已通过"
        case .rejected:
            title = "已拒绝"
        }
        return title
    }
    
}
