//
//  UIButton+Extension.swift
//  Ctaa
//
//  Created by ReevesGoo on 2017/9/5.
//  Copyright © 2017年 TouchMedia. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

//扩展UIButton的Reactive属性 可以通过rx来访问
//extension Reactive where Base:UIButton{
//    var btnValidState:Binder<Bool>{
//        
//        return Binder(base, binding: { (button, valid) in
//            button.isEnabled = valid
//            button.backgroundColor = valid ? UIColor.blue : UIColor.gray
//        })
//    }
//}

//定义protocol
protocol MTLog {
    func logEvent(category: String, action: String, label: String?, value: NSNumber?)
    func errorHandle(error: String)
}
// 扩展protocol
extension MTLog {
    func logEvent(category: String, action: String, label: String? = nil, value: NSNumber? = nil ) {
        
    }
}

extension MTLog where Self:UIViewController{
    
    func errorHandle(error: String) {
        let alertController = UIAlertController(title: nil, message: error, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension UIButton {
    
    convenience init(textColor:UIColor,fontSize:CGFloat,imageName:String?) {
        
        self.init(type: .custom)
        self.setTitleColor(textColor, for: .normal)
        self.adjustsImageWhenHighlighted = false
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        if (imageName != nil) {
            self.setImage(UIImage.init(named: imageName!), for: .normal)
        }
    }

    //自定义可绑定属性 弃用 替换为extension Reactive where Base:UIButton
    var btn_validState:AnyObserver<Bool>{
        return Binder(self, binding: { (button, valid) in
            button.isEnabled = valid
            button.backgroundColor = valid ? UIColor.blue : UIColor.gray
        }).asObserver()
    }
    
    var btn_EnableState:AnyObserver<Bool>{
        return Binder( self, binding: { (button, valid) in
            button.isEnabled = valid
//            button.backgroundColor = valid ? mainColor : bgGrayColor2
        }).asObserver()
    }
    
//    var ex_validState:AnyObserver<Bool>{
//    
//        return UIBindingObserver(UIElement: self, binding: { (btn, valid) in
//            btn.isEnabled = valid
//        }).asObserver()
//
//
//    
    
    
}
