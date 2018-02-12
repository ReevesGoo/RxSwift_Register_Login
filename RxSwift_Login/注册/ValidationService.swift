//
//  ValidationService.swift
//  RxSwift_Login
//
//  Created by Reeves Goo on 2018/2/3.
//  Copyright © 2018年 ReevesGoo. All rights reserved.
//

import UIKit
import RxSwift

class ValidationService {
    
    static let instance = ValidationService()
    let minCharactersCount = 6
    
    //检测注册用户名有效性
    func validateUsername(username:String) -> Observable<Result> {
        
        if username.count == 0 {
            return .just(.empty)
        }
        
        if  username.count < minCharactersCount {
            return  .just(.failed(message: "用户名长度至少6个字符"))
        }
        
        if usernameValid(username: username) {
            return .just(.failed(message: "用户名已存在"))
        }
        return .just(.ok(message: "用户名可用"))
        
        
    }
    
    //检测登录用户名有效性
    func loginUsernameValid(username: String) -> Observable<Result> {
        if username.characters.count == 0 {
            return .just(.empty)
        }
        if usernameValid(username: username) {
            return .just(.ok(message: "用户名有效"))
        }
        return .just(.failed(message: "用户名不存在"))
    }
    
  
    
    //验证用户名 注册时判断是否存在 登录时判断是否有效
    func usernameValid(username:String) -> Bool {
        
//        let url = Bundle.main.path(forResource: "username", ofType: "plist")
//        let arr = NSArray.init(contentsOf: URL.init(string: url!)!) as! Array<String>
        let userDict = userdefault.dictionary(forKey: "userDict")! as NSDictionary
        let userArr = userDict.allKeys as! [String]
        if userArr.contains(username) {
            return true
        }else{
            return false
        }

    }
    
    //注册密码验证
    func validatePassword(password:String) -> Result {
        
        if password.count == 0 {
            return .empty
        }
        
        if  password.count < minCharactersCount {
            return  .failed(message: "密码至少6个字符")
        }
        
        return .ok(message: "密码可用")
    
    }
    

    
    //注册 二次输入密码验证
    func validateRepeatPassword(password:String,repeatPassword:String) -> Result {
        
        if repeatPassword.count == 0 {
            return .empty
        }
        
        if repeatPassword == password {
            return .ok(message: "密码匹配")
        }
        
        return .failed(message: "两次密码不一样")
        
    }
    
    //登录密码验证
    func validateLoginPassword(password:String) -> Result {
        
        if password.count == 0 {
            return .empty
        }
        
        if  password.count < minCharactersCount {
            return  .failed(message: "密码至少6个字符")
        }
        
        return .ok(message: "")
        
    }
    
    
    //注册功能
    func register(username:String,password:String) -> Observable<Result>{
        
        if var userDict = userdefault.dictionary(forKey: "userDict"){

            userDict[username] = password
            userdefault.set(userDict, forKey: "userDict")
            userdefault.synchronize()
            
            return Observable.just(Result.ok(message: "注册成功"))
            
        }else{
            return Observable.just(Result.failed(message: "注册失败"))
        }
    }
    
    //登录功能
    func login(username:String,password:String) -> Observable<Result>{
        
        if var userDict = userdefault.dictionary(forKey: "userDict"){
            let pass = userDict[username] as! String
            if pass == password {
                return Observable.just(Result.ok(message: "登录成功"))
            }else{
                return Observable.just(Result.failed(message: "密码错误"))
            }
        }else{
            return Observable.just(Result.failed(message: "网络错误"))
        }
    }
    
    
    
    

}
