//
//  UILabel+Extension.swift
//  
//
//  Created by Reeves Goo on 15/12/9.
//  Copyright © 2015年 ReevesGoo. All rights reserved.
//

import UIKit

 extension UILabel {

  
    convenience init(textColor:UIColor,fontSize:CGFloat,maxWidth:CGFloat = 0) {
    
        self.init()
        
        self.textColor = textColor
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.textAlignment = .center
        if maxWidth > 0 {
        
            numberOfLines = 0;
            preferredMaxLayoutWidth = maxWidth
    
        }
    
    }
    
    //设置行间距
    func setRowSpaceAndFont(str:String,fontSize:CGFloat,space:CGFloat) {
        
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.alignment = .left
        paraStyle.lineSpacing = space
        paraStyle.lineBreakMode = .byTruncatingTail
        let dic = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: fontSize),NSAttributedStringKey.paragraphStyle:paraStyle]
        let  attributeStr = NSAttributedString.init(string: str, attributes: dic)
    
        attributedText = attributeStr

    }
    
    //富文本 计算label高度
    func caculateAttributeHeight(str:String,fontSize:CGFloat,space:CGFloat,width:CGFloat) -> CGFloat {
        
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.alignment = .left
        paraStyle.lineSpacing = space
        let dic = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: fontSize),NSAttributedStringKey.paragraphStyle:paraStyle]
       
        let rect = (str as NSString).boundingRect(with: CGSize(width: width, height: 0), options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: dic, context: nil)
        let labelH = CGFloat(ceilf(Float(rect.size.height)))
        return labelH
    }
    

}
