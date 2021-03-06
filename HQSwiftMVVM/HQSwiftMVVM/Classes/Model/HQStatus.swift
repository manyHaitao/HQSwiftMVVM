//
//  HQStatus.swift
//  HQSwiftMVVM
//
//  Created by 王红庆 on 2017/7/18.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit
import YYModel

/// 微博数据模型
class HQStatus: NSObject {
    
    /*
     `Int`类型,在`64`位的机器是`64`位,在`32`位的机器是`32`位
     如果不写明`Int 64`在 iPad 2 / iPhone 5/5c/4s/4 都无法正常运行
     */
    /// 微博ID
    var id: Int64 = 0
    /// 微博信息内容
    var text: String?
    
    /// 用户属性信息
    var user: HQUser?
    
    /// 转发数
    var reposts_count: Int = 0
    /// 评论数
    var comments_count: Int = 0
    /// 表态数
    var attitudes_count: Int = 0
    /*
     此处会崩溃
     */
    /// 微博配图模型数组
    var pic_urls: [HQStatusPicture]?
    
    override var description: String {
        
        return yy_modelDescription()
    }
}
