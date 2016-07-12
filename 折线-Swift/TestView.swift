//
//  TestView.swift
//  折线-Swift
//
//  Created by web2 on 16/7/12.
//  Copyright © 2016年 fyb. All rights reserved.
//

import UIKit

class TestView: UIView {
var pointArr:NSMutableArray = NSMutableArray()
var displayAnimated = Bool()
var pathAnimation = CABasicAnimation()
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath()
        for pointStr in pointArr {
            let path2 = UIBezierPath()
            let point = CGPointFromString(pointStr as! String)
            path2.addArcWithCenter(CGPointMake(point.x, point.y), radius:4 , startAngle: 0, endAngle:CGFloat(M_PI*2), clockwise: true)
            if pointArr.indexOfObject(pointStr) == 0 {
                path.moveToPoint(point)
            }
            else if(!pointStr.isEqualToString("")){
                path.addLineToPoint(point)
            }
            UIColor.blackColor().setStroke()
            UIColor.blackColor().setFill()
            path2.lineWidth = 2;
            path2.stroke()
            path2.fill()
        }
        
        //动画
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.blackColor().CGColor
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.path = path.CGPath
        shapeLayer.frame = self.bounds
        self.layer.addSublayer(shapeLayer)

        let pathAnima = CABasicAnimation()
        pathAnima.keyPath = "strokeEnd"
        pathAnima.duration = 2.0
        pathAnima.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
        pathAnima.fromValue = 0.0
        pathAnima.toValue = 2.0
        pathAnima.removedOnCompletion = false
        shapeLayer.addAnimation(pathAnima, forKey: "strokeEndAnimation")
    }
}
