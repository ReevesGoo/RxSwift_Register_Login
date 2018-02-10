//
//  NSDate+Extension.swift
//  
//
//  Created by Reeves Goo on 15/12/13.
//  Copyright © 2015年 ReevesGoo. All rights reserved.
//

import Foundation

extension NSDate {

    
    // 通过创建时间字符串返回其对应的NSDate
    class func weiboDate(createTimeStr:String) -> NSDate? {
        
        let dt = DateFormatter()
        dt.dateFormat = "EEE MMM dd HH:mm:ss z yyyy"
        dt.locale = NSLocale(localeIdentifier: "en_US") as Locale!
        
        let creatDate = dt.date(from: createTimeStr)
       
//        print("\(createTimeStr)----->\(creatDate)")
        
        return creatDate as! NSDate
    }
    
    //返回时间对应显示的字符串
    var weiboDateString:String {
    
        let dt = DateFormatter()
        dt.locale = NSLocale(localeIdentifier: "en_US") as Locale!
        
        let calendar = NSCalendar.current
        
        if isThisYear(date: self) {
        
            dt.dateFormat = "今年"
            
            if calendar.isDateInToday(self as Date) {
            
                let resultTime = -self.timeIntervalSinceNow
                
                if resultTime < 60 {
                
                    return "刚刚"
                }else if resultTime < 3600 {
                
                return "\(Int(resultTime)/60)分钟前"
                }else {
                
                return "\(Int(resultTime)/3600)小时前"
                
                }
            
            
            }else if calendar.isDateInYesterday(self as Date) {
            
                dt.dateFormat = "昨天 HH:mm"
                
            
            }else {
            
                dt.dateFormat = "MM-dd HH:mm"
            }
        }else {
        
            dt.dateFormat = "yy-MM-dd HH:mm"
        }
    
    return dt.string(from: self as Date)
        
    
    }
    
    // 判断传入的 date 与当前时间是否是同一年 
    private func isThisYear(date:NSDate) -> Bool {
    
        let currentDate = NSDate()
        let dt = DateFormatter()
        dt.dateFormat = "yyyy"
        dt.locale = NSLocale(localeIdentifier: "en_US") as Locale!
        
        let dateStr = dt.string(from: date as Date)
        let currentStr = dt.string(from: currentDate as Date)
        
        return (dateStr as NSString).isEqual(to: currentStr)
    
    
    }
    
    
    








}
