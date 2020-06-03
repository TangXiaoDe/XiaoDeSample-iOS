//
//  TestViewController.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/5/18.
//  Copyright © 2020 XiaoDe. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    
    fileprivate let iconView: UIImageView = UIImageView.init()
    
    fileprivate let normalBtn: UIButton = UIButton.init(type: .custom)
    
    fileprivate let titleLeftIconRightBtn: UIButton = UIButton.init(type: .custom)
    fileprivate let titleRightIconLeftBtn: UIButton = UIButton.init(type: .custom)
    fileprivate let titleUpIconDownBtn: UIButton = UIButton.init(type: .custom)
    fileprivate let titleDownIconUpBtn: UIButton = UIButton.init(type: .custom)
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.red
     
        
        let icon = UIImage.init(named: "IMG_mall_order_btn_slide_pre")
        let iconsize: CGSize = CGSize.init(width: 30, height: 16)
        let title: String = "确定"
        //let titleSize: CGSize =
        
        
        self.view.addSubview(titleLeftIconRightBtn)
        
        
        
        
        
        
//        - (void)layoutButtonWithImageTitleSpace:(CGFloat)space {
//            CGFloat imageWith = self.imageView.image.size.width;
//            CGFloat imageHeight = self.imageView.image.size.height;
//            CGFloat labelWidth = self.titleLabel.intrinsicContentSize.width;
//            CGFloat labelHeight = self.titleLabel.intrinsicContentSize.height;
//
//            UIEdgeInsets imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
//            UIEdgeInsets labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
//            self.titleEdgeInsets = labelEdgeInsets;
//            self.imageEdgeInsets = imageEdgeInsets;
//        }
        
        
        
        
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
