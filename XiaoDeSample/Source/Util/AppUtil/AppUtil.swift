//
//  AppUtil.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/6/3.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  工具类

import Foundation
import UIKit

class AppUtil
{
    
}

extension AppUtil
{
    /// 通用的渐变色Layer，需添加frame，从左侧居中到右侧居中，
    class func commonGradientLayer() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.locations = [0, 1]
        gradientLayer.colors = [UIColor.init(hex: 0xFF75E5).cgColor, UIColor.init(hex: 0x4ED1FC).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        return gradientLayer
    }
    
    /// 导出渐变Layer为渐变图片，并重新指定大小
    class func exportGradientImage(from layer: CAGradientLayer, size: CGSize) -> UIImage? {
        layer.frame = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }

}
