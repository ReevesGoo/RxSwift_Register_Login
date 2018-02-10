//
//  ViewController.swift
//  
//
//  Created by Reeves Goo on 15/12/6.
//  Copyright © 2015年 ReevesGoo. All rights reserved.
//

import UIKit


extension UIView {
    

    @IBInspectable var cornerRadius:CGFloat{
    
        get{
        return layer.cornerRadius
        
        }
        set{
        
        layer.cornerRadius = newValue
        layer.masksToBounds = cornerRadius > 0
        
        }

    }
    
    @IBInspectable var borderColor: UIColor? {
        get{
            guard let c = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: c)

        }
        set{
            layer.borderColor = newValue?.cgColor
        }
    }
    
 
    @IBInspectable var borderWidth: CGFloat {
        get{
            return layer.borderWidth
        }
        set{
            layer.borderWidth = newValue
        }
    }
}
