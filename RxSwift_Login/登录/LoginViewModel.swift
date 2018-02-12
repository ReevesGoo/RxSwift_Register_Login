//
//  LoginViewModel.swift
//  RxSwift_Login
//
//  Created by Reeves Goo on 2018/2/11.
//  Copyright © 2018年 ReevesGoo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewModel {

    //输出流
    let usernameUsable:Driver<Result>
    let passwordUsable:Driver<Result>
    let loginButtonEnable:Driver<Bool>
    let loginResult:Driver<Result>
    
    init(input:(username:Driver<String>,password:Driver<String>,loginTap:Driver<Void>),service:ValidationService) {
        
        usernameUsable = input.username.flatMapLatest({ (username) in
            return service.loginUsernameValid(username: username).asDriver(onErrorJustReturn: .failed(message: "连接服务器失败"))
        })
        
        passwordUsable = input.password.map({ (pass) in
            return service.validateLoginPassword(password: pass)
        }).asDriver()
        
        
        loginButtonEnable = Driver.combineLatest(usernameUsable, passwordUsable, resultSelector: {
            return $0.isValid && $1.isValid
        })
        
        
        let userAndPass = Driver.combineLatest(input.username, input.password) { ($0,$1)
        }
        
        loginResult = input.loginTap.withLatestFrom(userAndPass).flatMapLatest({ (user,pass) in
            return service.login(username: user, password: pass).asDriver(onErrorJustReturn: Result.failed(message: "网络错误"))
        })
        
        
        
        
   
    }
    
    
    
}
