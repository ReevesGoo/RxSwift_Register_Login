//
//  UITextField+Extension.swift
//  Ctaa
//
//  Created by ReevesGoo on 2017/9/5.
//  Copyright © 2017年 TouchMedia. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension UITextField {
    var limitState:AnyObserver<Bool>{
        return UIBindingObserver(UIElement: self) { textfield, valid in
            if valid {
                textfield.text = (textfield.text! as NSString).substring(with: NSRange.init(location: 0, length: 11))
            }
            }.asObserver()
    }
}
