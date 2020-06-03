//
//  AppImage.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/5/25.
//  Copyright © 2020 XiaoDe. All rights reserved.
//
//  

import UIKit


class AppImage: UIImage
{
    // 图片加载重写，减少运行时内存占用
    
    
    /// 占位图统一处理
    struct PlaceHolder {
        static let icon: UIImage? = UIImage.init(named: "IMG_icon_placeholder")
        static let logo: UIImage? = UIImage.init(named: "IMG_icon_placeholder")
        static let avatar: UIImage? = UIImage.init(named: "IMG_icon_placeholder")
        static let product: UIImage? = UIImage.init(named: "IMG_icon_placeholder")
        static let image: UIImage? = UIImage.init(named: "IMG_icon_placeholder")

        static let user_man: UIImage? = UIImage.init(named: "IMG_icon_placeholder")
        static let user_woman: UIImage? = UIImage.init(named: "IMG_icon_placeholder")
        static let user_secrecy: UIImage? = UIImage.init(named: "IMG_icon_placeholder")
    }

//    /// 获取用户占位头像，性别不同占位头像不同
//     static func placeHolder(for user: SimpleUserModel?) -> UIImage? {
//        var placeholder: UIImage? = UserSex.unknown.placeholder
//        guard let user = user else {
//            return placeholder
//        }
//        placeholder = user.sex.placeholder
//        return placeholder
//    }
//     static func placeHolder(for userSex: UserSex?) -> UIImage? {
//        var placeholder: UIImage? = UserSex.unknown.placeholder
//        guard let sex = userSex else {
//            return placeholder
//        }
//        placeholder = sex.placeholder
//        return placeholder
//    }


}

