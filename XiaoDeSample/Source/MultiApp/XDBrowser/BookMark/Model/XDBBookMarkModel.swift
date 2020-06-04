//
//  XDBBookMarkModel.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/6/3.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  书签数据模型

import Foundation
import ObjectMapper

/// 书签数据模型
class XDBBookMarkModel: Mappable
{

    /// id
    var id: Int = 0
    /// 用户id
    var user_id: Int = 0
    /// 标题
    var title: String = ""
    /// 完整链接
    var link: String = ""
    /// 域名、主机、
    var domain: String = ""
    /// 类别
    var cate_id: Int = 0
    var cate_name: String = ""
    /// 标签
    var tags: [String] = []
    /// 关键字
    var keywords: [String] = []
    /// 是否有效
    var is_valid: Bool = true
    /// 创建时间
    var createDate: Date =  Date()
    /// 上次修改时间
    var updateDate: Date =  Date()
    
    var iconUrl: URL? {
        var strUrl: String = ""
        if self.domain.hasSuffix("/") {
            strUrl = self.domain + "favicon.ico"
        } else if !self.domain.isEmpty {
            strUrl = self.domain + "/favicon.ico"
        }
        let url: URL? = URL.init(string: strUrl)
        return url
    }
    
    init(title: String, domain: String, link: String) {
        self.title = title
        self.domain = domain
        self.link = link
    }
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        id <- map["id"]
        user_id <- map["user_id"]
        title <- map["title"]
        link <- map["link"]
        domain <- map["domain"]
        cate_id <- map["cate_id"]
        cate_name <- map["cate_name"]
        tags <- map["tags"]
        keywords <- map["keywords"]
        is_valid <- map["is_valid"]
        createDate <- (map["created_at"], DateStringTransform.current)
        updateDate <- (map["updated_at"], DateStringTransform.current)
    }
    
}


