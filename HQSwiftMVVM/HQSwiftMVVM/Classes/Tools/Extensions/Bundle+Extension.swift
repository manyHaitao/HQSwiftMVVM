//
//  Bundle+Extension.swift
//  HQSwiftMVVM
//
//  Created by 王红庆 on 2017/7/6.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import Foundation

extension Bundle {
    
    // 计算型属性类似于函数,没有参数,有返回值
    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
}