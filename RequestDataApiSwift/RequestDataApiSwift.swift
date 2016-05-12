//
//  RequestDataApiSwift.swift
//  RequestDataApiSwift
//
//  Created by mac on 16/5/12.
//  Copyright © 2016年 Jack YY. All rights reserved.
//

import UIKit

typealias Comletion = (ret:NSDictionary) ->Void
enum RequestMethodType:NSInteger
{
    case RequestMethodTypePost = 1
    case RequestMethodTypeGet = 2
}
class RequestDataApiSwift: NSObject
{
    static let shareRequestApi:RequestDataApiSwift = RequestDataApiSwift()
    private override init() {
        
    }
    var Conletionblock:Comletion?
    func finishblock(dataload:Comletion?)
    {
        Conletionblock = dataload
    }
    var requertHttpSwift:RequsetHttpClassSwift = RequsetHttpClassSwift()
    
    func requestWihtMethod(Method:RequestMethodType,Urlstr:String,param:String)->Void
    {
        
        requertHttpSwift = RequsetHttpClassSwift(URL: NSURL(string: Urlstr)!)
        requertHttpSwift.timeoutInterval = 30.0
        switch Method
        {
            case .RequestMethodTypeGet:
                requertHttpSwift.HTTPMethod = "GET"
            break
            
            case .RequestMethodTypePost:
                requertHttpSwift.HTTPMethod = "POST"
                requertHttpSwift.HTTPBody = param.dataUsingEncoding(NSStringEncoding(UTF8Char.init()), allowLossyConversion: true)
                break
            default:
                
            break
            
        }
        requertHttpSwift.startAsync()
        requertHttpSwift.finishLoad { (dataT) -> Void in
            do {
                let jsonData = try NSJSONSerialization.JSONObjectWithData(dataT, options:NSJSONReadingOptions.MutableContainers ) as! NSDictionary
                if self.Conletionblock != nil{
                    self.Conletionblock!(ret: jsonData)
                }
            } catch {
                
            }
        }
    }
}
