//
//  SystemRequestInfo.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2019/6/14.
//  Copyright © 2019 XiaoDeStudio. All rights reserved.
//
//  系统相关请求信息

import Foundation

/// 系统相关请求信息
class SystemRequestInfo {
    /// 版本控制 - 当前最新版本
    static let latestVersion = RequestInfo<ServerVesionModel>.init(method: .get, path: "version/{:type}", replaceds: ["{:type}"])
    /// 服务器配置 - 应用启动
    static let serverConfig = RequestInfo<ServerConfigModel>.init(method: .get, path: "config", replaceds: [])



}
