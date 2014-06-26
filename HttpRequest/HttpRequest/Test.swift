//
//  Test.swift
//  HttpRequest
//
//  Created by zlm on 14/6/26.
//  Copyright (c) 2014年 zlm. All rights reserved.
//

import Foundation

func test(){
    
    // first method
    let testUrl = "http:www.zouliangming.com/v.php"
    
    HttpRequest.post(testUrl, dictionary:nil, finish:{(response: NSHTTPURLResponse!, data: AnyObject!, error: NSError!) -> Void in
        
//        let dic = data as Dictionary<String, AnyObject>
//        for (key, _) in dic {
//            println("\(key)")
//        }
        });
    
//    // another method
//    let result = {(response: NSHTTPURLResponse!, data: AnyObject, error: NSError!) -> Void in
//        
//    };
//    
//    HttpRequest.post(testUrl, dictionary:nil, finish:result);
}