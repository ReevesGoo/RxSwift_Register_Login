//
//  Protocol.swift
//  RxSwift_Login
//
//  Created by Reeves Goo on 2018/2/3.
//  Copyright © 2018年 ReevesGoo. All rights reserved.
//
import UIKit
import Foundation
import RxSwift
import RxCocoa

enum Result {
    case ok(message:String)
    case empty
    case failed(message:String)
}

extension Result {
    
    var desc:String{
        switch self {
        case .ok(let message):
            return message
        case .empty:
            return ""
        case .failed(let message):
            return message
        }
    }
    
    
    var isValid:Bool{
        
        switch self {
        case .ok:
            return true
        default:
            return false
        }
    }
    
    var textColor:UIColor{
        switch self {
        case .ok:
            return UIColor(red: 138.0/255.0, green: 271.0/255.0, blue: 109.0/255.0, alpha: 1.0)
        case .empty:
            return UIColor.black
        case.failed:
            return UIColor.red
        }
    }
 
}

//扩展UIButton的Reactive属性
extension Reactive where Base:UIButton{
    var btnValidState:Binder<Bool>{
        return Binder(base, binding: { (button, valid) in
            button.isEnabled = valid
            button.alpha = valid ? 1.0 : 0.5
        })
    }
}

extension Reactive where Base:UILabel{
    
    var validationResult:Binder<Result>{
        
        return Binder.init(base, binding: { (label, result) in
            
            label.textColor = result.textColor
            label.text = result.desc
            
        })
        
    }
    
}

extension Reactive where Base:UITextField{
    
    var inputEnable:Binder<Result>{
        
        return Binder.init(base, binding: { (textField, result) in
            textField.isEnabled = result.isValid
        })
        
    }
    
    
}












