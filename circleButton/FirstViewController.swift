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
    @IBOutlet var panView: UIView!
    var circleViewShow = false

    let tapRec = UITapGestureRecognizer()
    let panRec = UIPanGestureRecognizer()
    
    let tapRec2 = UITapGestureRecognizer()
    
    var panviewPosition:CGPoint!
    
    func tappedView(){
        shareCircleView.show()
        //println("\(panView.center)")
        panviewPosition = panView.center
        panView.alpha = 0.5
        //self.view.sendSubviewToBack(panView)
    }
    
    func tappedView2(){
        panView.alpha = 0.5
    }
    
    func draggedView(sender:UIGestureRecognizer){
        
        panView.alpha = 1.0
        var translation = panRec.translationInView(self.view)
            
        panView.center = CGPointMake(sender.view!.center.x + translation.x, sender.view!.center.y + translation.y)
        panRec.setTranslation(CGPointZero, inView: self.view)
        
        self.panviewPosition = CGPointMake(sender.view!.center.x + translation.x, sender.view!.center.y + translation.y)
    }

    @IBAction func touch(sender: AnyObject) {
        
    }
    
    func shareCircleView(aShareCircleView: CFShareCircleView!, didSelectSharer sharer: CFSharer!) {
        println("selected : \(sharer.name)")
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()

        shareCircleView = CFShareCircleView(frame: self.view.frame)
        shareCircleView.delegate = self
        
        panRec.addTarget(self,action:"draggedView:")
        tapRec.addTarget(self,action:"tappedView")
        tapRec2.addTarget(self,action:"tappedView2")
        
        panView.addGestureRecognizer(panRec)
        panView.addGestureRecognizer(tapRec)
        //self.view.addGestureRecognizer(tapRec2)
        
        panView.layer.cornerRadius = 25
        //panView.userInteractionEnabled = true
        panView.alpha = 0.5
        self.view.addSubview(panView)
        
        if panviewPosition == nil{
            panviewPosition = panView.center
        }
        
        panView.center = panviewPosition
        self.view.addSubview(shareCircleView)

        //println("\(panView.center)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

