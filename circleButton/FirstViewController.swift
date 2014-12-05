//
//  FirstViewController.swift
//  circleButton
//
//  Created by 刘炳辰 on 14/12/4.
//  Copyright (c) 2014年 刘炳辰. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,CFShareCircleViewDelegate{
    
    var shareCircleView:CFShareCircleView!
    
    @IBAction func touch(sender: AnyObject) {
        shareCircleView.show()
    }
    
    func shareCircleView(aShareCircleView: CFShareCircleView!, didSelectSharer sharer: CFSharer!) {
        println("selected : \(sharer.name)")
    }
    
    override func viewDidLoad() {
        
        shareCircleView = CFShareCircleView(frame: self.view.frame)
        shareCircleView.delegate = self
        self.view.addSubview(shareCircleView)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

