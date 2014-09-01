//
//  DraggableView.swift
//  TinderStyleApp
//
//  Created by kiiita on 2014/09/01.
//  Copyright (c) 2014年 kiiita. All rights reserved.
//
// @property (weak) id <DraggableViewDelegate> delegate;

import Foundation

class DraggableView: UIView {
    
    weak var delegate: AnyObject?
    var information: UILabel = UILabel()
    var overlayView: OverlayView?
    var panGestureRecognizer: UIPanGestureRecognizer?
    
}

class DraggableViewDelegate :NSObject{
}

