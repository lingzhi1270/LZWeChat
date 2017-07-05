//
//  LZColor.swift
//  LZWeChat
//
//  Created by lingzhi on 2017/6/27.
//  Copyright © 2017年 lingzhi. All rights reserved.
//

import UIKit
import Foundation
/*
 *   颜色扩展，项目内所用到的颜色，在这里进行配置
 */

extension UIColor {
    class var barTintColor: UIColor{
        get {return UIColor.init(ts_hexString: "#1A1A1A")}
    }
    
    class var tabbarSelectedTextColor: UIColor {
        get {return UIColor.init(ts_hexString: "#68BB1E")}
    }
    
    class var viewBackgroundColor: UIColor {
        get {return UIColor.init(ts_hexString :"#E7EBEE")}
    }
}
