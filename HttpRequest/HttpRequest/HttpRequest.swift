//
//  HttpRequest.swift
//  HttpRequest
//
//  Created by zlm on 14/6/26.
//  Copyright (c) 2014年 zlm. All rights reserved.
//

import Foundation

let queue = NSOperationQueue()
typealias Response = (NSHTTPURLResponse!, AnyObject!, NSError!) -> Void

class HttpRequest {
    
    // start request
    class func startRequest(request: NSMutableURLRequest, finish: Response) {
        let completion = { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            let res = response as NSHTTPURLResponse!
            if (error) {
                finish(res, data, error)
            } else {
                var error: NSError?
                var json: AnyObject!
                if (data) {
                    
                    // convert to json
                    json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error)
                }
                finish(res, json, error)
            }
        }
        
        NSURLConnection.sendAsynchronousRequest(request, queue:queue, completionHandler: completion)
    }
    
    // get method
    class func get(url: String, finish: Response) {
        var request = NSMutableURLRequest(URL: NSURL(string: url))
        request.HTTPMethod = "GET"
        startRequest(request, finish: finish)
    }
    
    // get method with params dictionary
    class func get(url: String, dictionary: Dictionary<String, String>, finish: Response) {
        
        var newUrl = url
        if dictionary.count != 0 {
            newUrl += "?"
            var i = 0
            for (key ,value) in dictionary {
                if i != 0 {
                    newUrl += "&"
                }
                
                newUrl += "\(key)=\(value)"
                i++
            }
        }
        get(newUrl, finish: finish);
    }
    
    // post method with params dictionary
    class func post(url: String, dictionary: Dictionary<String, String>?, finish: Response) {
        
        var request = NSMutableURLRequest(URL: NSURL(string: url))
        request.HTTPMethod = "POST"
        
        if let newDic = dictionary {
            var error: NSError?
            let json = NSJSONSerialization.dataWithJSONObject(dictionary!, options: nil, error: &error)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.HTTPBody = json
        }
        startRequest(request, finish: finish)
    }
    
}