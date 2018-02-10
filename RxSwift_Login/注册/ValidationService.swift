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
    
    
    //验证用户名 判断是否存在
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
    
    func validatePassword(password:String) -> Result {
        
        if password.count == 0 {
            return .empty
        }
        
        if  password.count < minCharactersCount {
            return  .failed(message: "密码至少6个字符")
        }
        
        return .ok(message: "密码可用")
    
    }
    
    func validateRepeatPassword(password:String,repeatPassword:String) -> Result {
        
        if repeatPassword.count == 0 {
            return .empty
        }
        
        if repeatPassword == password {
            return .ok(message: "密码匹配")
        }
        
        return .failed(message: "两次密码不一样")
        
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
    
    
    
    

}
