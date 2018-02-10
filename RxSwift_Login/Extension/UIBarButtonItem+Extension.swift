//
//  ViewController.swift
//  
//
//  Created by Reeves Goo on 15/12/6.
//  Copyright © 2015年 ReevesGoo. All rights reserved.
//

import UIKit

// item字体大小
let ItemTitleFontSize: CGFloat = 16
// item字体颜色
let ItemTitleColor: UIColor = UIColor.darkGray

extension UIBarButtonItem{
    
    
    convenience init(imgName: String? = nil, title: String? = nil, target: AnyObject?, action: Selector) {
        self.init()
        
        let button = UIButton()
        // 添加点击事件
        button.addTarget(target, action: action, for: .touchUpInside)
        
       
        if let img = imgName {
            // 设置不同状态的图片
            button.setImage(UIImage(named: img), for: UIControlState.normal)
//            button.setImage(UIImage(named: "\(img)_highlighted"), for: UIControlState.highlighted)
        }
        
        if let t = title {
            button.setTitle(t, for: .normal)
            button.setTitleColor(ItemTitleColor, for: .normal)
//            button.setTitleColor(UIColor.orange, for: .highlighted)
            button.titleLabel?.font = UIFont.systemFont(ofSize: ItemTitleFontSize)
        }
        
        // 设置大小
        button.sizeToFit()

        customView = button
    }
    
    
   
    
    
}
