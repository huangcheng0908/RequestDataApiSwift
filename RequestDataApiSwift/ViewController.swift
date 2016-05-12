//
//  ViewController.swift
//  RequestDataApiSwift
//
//  Created by mac on 16/5/12.
//  Copyright © 2016年 Jack YY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func requstBut(sender: UIButton)
    {
          RequestDataApiSwift.shareRequestApi.requestWihtMethod(RequestMethodType.RequestMethodTypePost, Urlstr: "http://weinova.f3322.net:888/baby/trunk/source/index.php?s=/mobile/index/category", param: "")
          RequestDataApiSwift.shareRequestApi.finishblock { (ret) -> Void in
            print(ret)
        }
        
    }
    

}





