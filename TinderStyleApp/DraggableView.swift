//
//  DraggableView.swift
//  TinderStyleApp
//
//  Created by kiiita on 2014/09/01.
//  Copyright (c) 2014年 kiiita. All rights reserved.
//
// @property (weak) id <DraggableViewDelegate> delegate;

import Foundation

class DraggableViewDelegate :NSObject{
    func cardSwipeLeft(card: UIView) {}
    func cardSwipeRight(card: UIView) {}
}

enum UIGestureRecognizerState : Int {
    case Possible
    case Began
    case Changed
    case Ended
    case Cancelled
    case Failed
}

class DraggableView: UIView {
    
    weak var delegate: AnyObject?
    var information: UILabel = UILabel()
    var overlayView: OverlayView?
    var panGestureRecognizer: UIPanGestureRecognizer?
    var originalPoint: CGPoint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        information = UILabel(frame:CGRectMake(0, 50, self.frame.size.width, 100))
        information.text = "no info given"
        information.setTextAlignment(NSTextAlignment.Center)
        information.textColor = UIColor.blackColor()
        
        self.backgroundColor = UIColor.whiteColor()
        
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: beingDragged)
        self.addGestureRecognizer(panGestureRecognizer)
        self.addSubview(information)
        
        overlayView = OverlayView(frame: CGRectMake(self.frame.size.width/2-100, 0, 100, 100))
        overlayView.alpha = 0
        self.addSubview(overlayView)
        
    }
    
    func setupView() {
        self.layer.cornerRadius = 4
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSizeMake(1, 1)
    }
    
    func beingDragged(gestureRecognizer: UIPanGestureRecognizer) {
        xFromCenter = gestureRecognizer.translationInView(self).x
        yFromCenter = gestureRecognizer.translationInView(self).y
        
        switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:{
            self.originalPoint = self.center;
            break;
        };
        }
    
    }
    
    func leftClickAction() {
        var finishPoint: CGPoint = CGPointMake(600, self.center.y)
    }
    func rightClickAction() {}
    
}


