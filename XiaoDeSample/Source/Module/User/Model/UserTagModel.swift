//
//  UserTagModel.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/5/26.
//  Copyright © 2020 XiaoDe. All rights reserved.
//
//  用户标签数据模型

import Foundation
import ObjectMapper

/// 用户标签数据模型
class UserTagModel: Mappable
{
    var title: String = "哈哈哈"
    var id: Int = 0
    var cateId: Int = 0     /// categoryId

    /// 是否选中
    var isSelected: Bool = false

    init(id: Int = 0, cateId: Int = 0, title: String = "娃哈哈") {
        self.id = id
        self.cateId = cateId
        self.title = title
    }

    required init?(map: Map) {

    }
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["name"]
        cateId <- map["cate_id"]
    }

    // MARK: - Realm
    init(object: UserTagObject) {
        self.id = object.id
        self.title = object.title
        self.cateId = object.cateId
    }
    func object() -> UserTagObject {
        let object = UserTagObject()
        object.id = self.id
        object.title = self.title
        object.cateId = self.cateId
        return object
    }
    
    /// 宽度计算
    func itemWidth(with font: UIFont, lrMargin: CGFloat, maxWidth: CGFloat) -> CGFloat {
        let width: CGFloat = self.title.size(maxSize: CGSize.max, font: font).width + lrMargin * 2.0
        return min(width, maxWidth)
    }

}



