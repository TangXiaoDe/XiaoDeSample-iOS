//
//  BundleInfoModel.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2019/3/19.
//  Copyright © 2019 XiaoDeStudio. All rights reserved.
//
//  BundleInfo数据模型

import Foundation
import ObjectMapper

/// BundleInfo数据模型
class BundleInfoModel: Mappable {

    /// BundleID
    // var bundleId: String = Bundle.main.bundleIdentifier ?? ""
    var bundleId: String = ""
    /// DisplayName - 该字段可能为空
    var displayName: String?
    /// Version
    var version: String = ""
    /// Build
    var build: String = ""
    /// bundlename
    var name: String = ""

    init() {

    }

    required init?(map: Map) {

    }
    func mapping(map: Map) {
        //        "CFBundleShortVersionString": 1.0.2,
        //        "CFBundleIdentifier": io.XiaoDeSampletest.www,
        //        "CFBundleVersion": 9,
        //        "CFBundleDisplayName": 链乎Test,    // 可本地化
        //        "CFBundleName": XiaoDeSample,             // 可本地化
        //        "CFBundleExecutable": XiaoDeSample,
        bundleId <- map["CFBundleIdentifier"]
        displayName <- map["CFBundleDisplayName"]
        version <- map["CFBundleShortVersionString"]
        build <- map["CFBundleVersion"]
        name <- map["CFBundleName"]   // target
    }

}
