Introduction
This is a swift http request api. Support get and post request method. If you have any question, email to me: liangming_08@sina.com

Usage

Take post as example:

	// first method
    let testUrl = "http:www.zouliangming.com/v.php"
    
    HttpRequest.post(testUrl, dictionary:nil, finish:{(response: NSHTTPURLResponse!, data: AnyObject!, error: NSError!) -> Void in
        
    let dic = data as Dictionary<String, AnyObject>
//        for (key, _) in dic {
//            println("\(key)")
//        }
        });
    
      // another method
      let result = {(response: NSHTTPURLResponse!, data: AnyObject, error: NSError!) -> Void in
         
      };
    
     HttpRequest.post(testUrl, dictionary:nil, finish:result);

Get is same as post.