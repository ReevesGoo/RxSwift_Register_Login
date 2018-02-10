//
//  RegisterViewModel.swift
//  RxSwift_Login
//
//  Created by Reeves Goo on 2018/2/3.
//  Copyright © 2018年 ReevesGoo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewModel {

    //输入流
    let username = Variable<String>("")
    let password = Variable<String>("")
    let repeatPassword = Variable<String>("")
    let registerTaps = PublishSubject<Void>()

    //输出流
    let usernameUsable:Observable<Result>
    let passwordUsable:Observable<Result>
    let repeatPasswordUsable:Observable<Result>
    
    let registerButtonEnabel:Observable<Bool>
    let registerResult:Observable<Result>
    
    
    init() {
        
        let service = ValidationService.instance
        
        usernameUsable = username.asObservable().flatMapLatest({ (username) in
            return service.validateUsername(username: username).observeOn(MainScheduler.instance).catchErrorJustReturn(Result.failed(message: "用户名检测出错"))
            
        }).share(replay:1)
        
        passwordUsable = password.asObservable().map({ (password) in
            return service.validatePassword(password: password)
        }).share(replay:1)
        
        repeatPasswordUsable = Observable.combineLatest(password.asObservable(),repeatPassword.asObservable()){
                return service.validateRepeatPassword(password: $0, repeatPassword: $1)
            }.share(replay: 1)
        
        registerButtonEnabel = Observable.combineLatest(usernameUsable, passwordUsable,repeatPasswordUsable, resultSelector: { (user,pass,repeatPass) in
            return user.isValid && pass.isValid && repeatPass.isValid
        }).distinctUntilChanged().share(replay: 1)
        
        //返回username和password组合后的元组流
        let usernameAndPassword = Observable.combineLatest(username.asObservable(), password.asObservable()) {
            return ($0 , $1)
        }
        
        registerResult = registerTaps.asObserver().withLatestFrom(usernameAndPassword).flatMapLatest({ (user,pass) in
            
            return service.register(username: user, password: pass).observeOn(MainScheduler.instance).catchErrorJustReturn(Result.failed(message: "注册出错"))
            
        })
        
        
        
        
        
        
    }
    
    
}
