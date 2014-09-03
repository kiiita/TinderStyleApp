//
//  OverlayView.swift
//  TinderStyleApp
//
//  Created by kiiita on 2014/09/01.
//  Copyright (c) 2014年 kiiita. All rights reserved.
//

import Foundation
import UIKit

enum GGOverlayViewMode: Int {
    case Left
    case Right
}

class OverlayView: UIView{
    var mode: GGOverlayViewMode?
    var imageView: UIImageView = UIImageView()
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        imageView = UIImageView(image:UIImage(named: "noButton"))
    }
    
    func setMode(mode: GGOverlayViewMode) {
        
        if mode == GGOverlayViewMode.Left {
            imageView.image = UIImage(named: "noButton")
            println("hogeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")
        } else {
            imageView.image = UIImage(named: "yesButton")
            println("hugaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRectMake(50, 50, 100, 100)
            println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
        
    }
}