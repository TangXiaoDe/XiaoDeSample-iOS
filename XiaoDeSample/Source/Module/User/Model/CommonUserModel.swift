//
//  CommonUserModel.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/5/26.
//  Copyright © 2020 XiaoDe. All rights reserved.
//
//  当前用户数据模型

import Foundation
import ObjectMapper
import RealmSwift

// 简单用户数据模型
class SimpleUserModel: Mappable
{

    /// 用户id
    var id: Int = 0
    /// 用户id
    var objcID: Int = 0
    /// 用户名称
    var name: String = ""
    // TODO: - 将类似的命名中的filename去除，仅保留通用中的这种命名，使其更具普适性。
    /// 头像文件名称
    var avatarFileName: String? = nil
    /// 是否是好友
    var isFriend: Bool = false

    /// 手机号
    var phone: String? = nil
    /// iMeet账号
    var number: String = ""
    /// 性别
    var sexValue: Int = 0
    /// 好友申请状态 - 动态中的推荐用户时才存在该字段
    var applyStatus: Bool = false


    /// 性别
    var sex: UserSex {
        var sex: UserSex = UserSex.unknown
        if let userSex = UserSex.init(rawValue: self.sexValue) {
            sex = userSex
        }
        return sex
    }
    /// 头像链接
    var strAvatar: String? {
        return UrlManager.strFileUrl(name: self.avatarFileName)
    }
    /// 头像url
    var avatarUrl: URL? {
        return UrlManager.fileUrl(name: self.avatarFileName)
    }

    /// 是否选中
    var isSelected: Bool = false


    init(id: Int, name: String, sex: UserSex, avatarFileName: String?) {
        self.id = id
        self.objcID = id
        self.name = name
        self.sexValue = sex.rawValue
        self.avatarFileName = avatarFileName
    }

    required init?(map: Map) {

    }
    func mapping(map: Map) {
        id <- map["id"]
        objcID <- map["id"]
        name <- map["name"]
        avatarFileName <- map["avatar"]
        phone <- map["phone"]
        number <- map["number"]
        sexValue <- map["sex"]
        applyStatus <- map["apply_status"]
        isFriend <- map["is_friend"]
    }

}
