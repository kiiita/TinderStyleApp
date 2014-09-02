//
//  OverlayView.swift
//  TinderStyleApp
//
//  Created by kiiita on 2014/09/01.
//  Copyright (c) 2014年 kiiita. All rights reserved.
//

import Foundation

enum CGOverlayViewMode: Int {
    case Left
    case Right
}

class OverlayView: UIView{
    var mode: GGOverlayViewMode?
    var imageView: UIImageView?
    
    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        var imageView: UIImageView = UIImageView(image:UIImage(named: "noButton"))
    }
    
    func setMode(mode: GGOverlayViewMode) {
        
        if mode == GGOverlayViewMode.Left {
            imageView!.image = UIImage(named: "noButton")
        } else {
            imageView!.image = UIImage(named: "yesButton")
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView!.frame = CGRectMake(50, 50, 100, 100)
    }
}