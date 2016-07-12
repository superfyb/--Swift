//
//  ViewController.swift
//  折线-Swift
//
//  Created by web2 on 16/7/12.
//  Copyright © 2016年 fyb. All rights reserved.
//

import UIKit
//import TestView

class ViewController: UIViewController {
    let view1 = TestView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view1.frame = CGRectMake(5, 200, 500, 800)
        let pointArr = [CGPointMake(50, 100),CGPointMake(100, 200),CGPointMake(150, 120),CGPointMake(200, 140),CGPointMake(250, 60),CGPointMake(300, 110),CGPointMake(350, 250)]
        for point in pointArr {
            let pointStr = NSStringFromCGPoint(point)
            view1.pointArr.addObject(pointStr)
        }
        view1.backgroundColor = UIColor.clearColor()
        self.view.addSubview(view1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func reset(sender: UIButton) {
        view1.displayAnimated = true
    }

}

