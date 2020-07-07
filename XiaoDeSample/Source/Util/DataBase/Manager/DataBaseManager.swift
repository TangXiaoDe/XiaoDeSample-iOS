//
//  DataBaseManager.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2019/1/22.
//  Copyright © 2019 XiaoDeStudio. All rights reserved.
//
//  数据库管理
//  [注1]：不可使用单例来进行处理，否则会发生异常；

import Foundation
import RealmSwift

class DataBaseManager {

    /// 账户管理
    let account = AccountDBManager()

}

extension DataBaseManager {
    func deleteAll() -> Void {
        self.account.deleteAll()
    }

}
