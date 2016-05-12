//
//  RequsetHttpClassSwift.swift
//  RequestDataApiSwift
//
//  Created by mac on 16/5/12.
//  Copyright © 2016年 Jack YY. All rights reserved.
//

import UIKit

/** 声明闭包，点击按钮传值类似block */
typealias FinishLoadBlock = (dataT:NSData) ->Void
class RequsetHttpClassSwift: NSMutableURLRequest,NSURLSessionDataDelegate
{
    var dataN:NSMutableData = NSMutableData()
    var session:NSURLSession = NSURLSession()
    var dataTask:NSURLSessionDataTask = NSURLSessionDataTask()
    var block:FinishLoadBlock?
    func finishLoad(dataload:FinishLoadBlock?)
    {
        block = dataload
    }
    
    func startAsync()
    {
        dataN = NSMutableData.init();
        session = NSURLSession.init(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        dataTask = session.dataTaskWithRequest(self)
        dataTask.resume()
    }
    
    func cancel()
    {
        dataTask.cancel()
    }
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveResponse response: NSURLResponse, completionHandler: (NSURLSessionResponseDisposition) -> Void)
    {
        completionHandler(NSURLSessionResponseDisposition.Allow)
    }
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData)
    {
        dataN.appendData(data)
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?)
    {
        if error == nil{
            block!(dataT: dataN)
        }else
        {
            print(error)
        }
    }
}
