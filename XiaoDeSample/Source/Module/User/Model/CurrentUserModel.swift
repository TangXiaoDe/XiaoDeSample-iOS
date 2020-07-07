//
//  CurrentUserModel.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/5/26.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

/// 当前用户
class CurrentUserModel: Mappable
{

    /// id
    var id: Int = 0
    /// 昵称
    var name: String = ""
    /// 性别 0-未知[保密] 1-男 2-女
    var sexValue: Int = 0
    /// 电话号码，[注]返回的电话号码中间4位数字处理过
    var phone: String = ""
    /// IMeet账号
    var number: String = ""
    /// 头像名称
    var avatar: String? = nil
    /// 背景链接
    var background: String? = nil
    /// 生日
    var birthday: String? = nil
    /// 环信登录密码
    var easemobPwd: String = ""
    /// 邀请码
    var inviteCode: String = ""
    /// 简介
    var bio: String = ""
    /// 矿力
    var power: Int = 0
    /// 是否设置过支付密码
    var payPwdStatus: Bool = false
    /// tags
    var tags: [UserTagModel] = []

    /// 拥有CT数(矿石) - 非用户接口提供，而由别的接口提供
    var totalCT: Double = 0.0


    /// 性别
    var sex: UserSex {
        var sex: UserSex = UserSex.unknown
        if let userSex = UserSex.init(rawValue: self.sexValue) {
            sex = userSex
        }
        return sex
    }
    /// 认证状态
    var certStatusValue: String = ""    // 数据库存储字段
    var certStatus: UserCertificationStatus {
        var status = UserCertificationStatus.unCertified
        if let realStatus = UserCertificationStatus.init(rawValue: self.certStatusValue) {
            status = realStatus
        }
        return status
    }

    /// 头像链接
    var strAvatar: String? {
        return UrlManager.strFileUrl(name: self.avatar)
    }
    /// 头像url
    var avatarUrl: URL? {
        return UrlManager.fileUrl(name: self.avatar)
    }


    required init?(map: Map) {

    }
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        sexValue <- map["sex"]
        phone <- map["phone"]
        number <- map["number"]
        avatar <- map["avatar"]
        background <- map["background"]
        birthday <- map["birthday"]
        easemobPwd <- map["easemob_pass"]
        inviteCode <- map["invite_code"]
        bio <- map["bio"]
        power <- map["power"]
        payPwdStatus <- map["pay_pass_status"]
        tags <- map["tags"]
    }

    // MARK: - Realm
    init(object: CurrentUserObject) {
        self.id = object.id
        self.name = object.name
        self.sexValue = object.sexValue
        self.phone = object.phone
        self.number = object.number
        self.avatar = object.avatar
        self.background = object.background
        self.birthday = object.birthday
        self.easemobPwd = object.easemobPwd
        self.inviteCode = object.inviteCode
        self.bio = object.bio
        self.power = object.power
        self.payPwdStatus = object.payPwdStatus
        self.certStatusValue = object.certStatusValue
        for tagObject in object.tags {
            self.tags.append(UserTagModel.init(object: tagObject))
        }
    }
    func object() -> CurrentUserObject {
        let object = CurrentUserObject()
        object.id = self.id
        object.name = self.name
        object.sexValue = self.sexValue
        object.phone = self.phone
        object.number = self.number
        object.avatar = self.avatar
        object.background = self.background
        object.birthday = self.birthday
        object.easemobPwd = self.easemobPwd
        object.inviteCode = self.inviteCode
        object.bio = self.bio
        object.power = self.power
        object.payPwdStatus = self.payPwdStatus
        object.certStatusValue = self.certStatusValue
        for tagModel in self.tags {
            object.tags.append(tagModel.object())
        }
        return object
    }

    /// tag拼接
    func tagJoin(with separator: String = " ") -> String? {
        if self.tags.isEmpty {
            return nil
        }
        var strTag: String = ""
        for (index, tag) in self.tags.enumerated() {
            if 0 == index {
                strTag = tag.title
            } else {
                strTag += (separator + tag.title)
            }
        }
        return strTag
    }

}

