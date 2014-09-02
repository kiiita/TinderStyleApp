//
//  DraggableViewBackground.swift
//  TinderStyleApp
//
//  Created by kiiita on 2014/09/01.
//  Copyright (c) 2014年 kiiita. All rights reserved.
//

import Foundation
import UIKit

class DraggableViewBackground: UIView, DraggableViewDelegate{
    
    var cardsLoadedIndex:NSInteger = NSInteger()
    var loadedCards: NSMutableArray = NSMutableArray()
    
    var menuButton: UIButton = UIButton()
    var messageButton: UIButton = UIButton()
    var xButton: UIButton = UIButton()
    var checkButton: UIButton = UIButton()
    
    let MAX_BUFFER_SIZE: Int = 2
    let CARD_HEIGHT: CGFloat = 260
    let CARD_WIDTH: CGFloat = 260
    
    var exampleCardLabels: NSArray = NSArray()
    var allCards: NSMutableArray = NSMutableArray()
    
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.layoutSubviews()
        self.setupView()
        
        exampleCardLabels = ["hoge1", "hoge2", "hoge3", "hoge4", "hoge5"]
        loadedCards = []
        cardsLoadedIndex = 0
        self.loadCards()
    
    }
    
    func setupView() {
        self.backgroundColor = UIColor(red: 0.92, green: 0.93, blue: 0.95, alpha: 1.0);
        menuButton = UIButton(frame:CGRectMake(17,34,22,15))
        messageButton = UIButton(frame:CGRectMake(284,34,18,18))
        xButton = UIButton(frame:CGRectMake(60,485,59,59))
        checkButton = UIButton(frame:CGRectMake(200,485,59,59));
        let menuButtonImage = UIImage(named: "menuButton")
        let messageButtonImage = UIImage(named: "messageButton")
        let xButtonImage = UIImage(named: "xButton")
        let checkButtonImage = UIImage(named: "checkButton")
        menuButton.setImage(menuButtonImage, forState: UIControlState.Normal)
        messageButton.setImage(messageButtonImage, forState: UIControlState.Normal)
        xButton.setImage(xButtonImage, forState: UIControlState.Normal)
        checkButton.setImage(checkButtonImage, forState: UIControlState.Normal)
        self.addSubview(menuButton)
        self.addSubview(messageButton)
        self.addSubview(xButton)
        self.addSubview(checkButton)

    }
    
    func createDraggableViewWithDataAtIndex(index: Int) -> DraggableView {
//        var draggableView: DraggableView = DraggableView(frame:CGRectMake(30, 100, CARD_WIDTH, CARD_HEIGHT))
        var draggableView: DraggableView = DraggableView(frame: CGRectMake((self.frame.size.width - CARD_WIDTH)/2, (self.frame.size.height - CARD_HEIGHT)/2, CARD_WIDTH, CARD_HEIGHT))
        draggableView.information.text = exampleCardLabels.objectAtIndex(index) as String
        draggableView.delegate = self
        return draggableView
    
    }
    
    func loadCards() -> (Void) {
        if (exampleCardLabels.count > 0) {
            var numLoadedCardsCap = ((exampleCardLabels.count > MAX_BUFFER_SIZE) ? MAX_BUFFER_SIZE : exampleCardLabels.count )
            
            var i:Int
            for (i = 0; i < exampleCardLabels.count; i++) {
                var newCard: DraggableView = self.createDraggableViewWithDataAtIndex(i)
                allCards.addObject(newCard)
            }
            
            for (i = 0; i < loadedCards.count; i++) {
                if (i > 0) {
                    self.insertSubview(loadedCards.objectAtIndex(i) as UIView, belowSubview: loadedCards.objectAtIndex(i-1) as UIView)
                } else {
                    self.addSubview(loadedCards.objectAtIndex(i) as UIView)
                }
                cardsLoadedIndex++
            }
        }
    }
    
    func cardSwipedLeft(card: UIView) {
        loadedCards.removeObjectAtIndex(0)
        if ( cardsLoadedIndex < allCards.count ) {
            loadedCards.addObject(allCards.objectAtIndex(cardsLoadedIndex))
            cardsLoadedIndex++
            self.insertSubview(loadedCards.objectAtIndex(MAX_BUFFER_SIZE-1) as UIView, belowSubview: loadedCards.objectAtIndex(MAX_BUFFER_SIZE-2) as UIView)
        }
    }
    
    func cardSwipedRight(card: UIView) {
        loadedCards.removeObjectAtIndex(0)
        if ( cardsLoadedIndex < allCards.count ) {
            loadedCards.addObject(allCards.objectAtIndex(cardsLoadedIndex))
            cardsLoadedIndex++
            self.insertSubview(loadedCards.objectAtIndex(MAX_BUFFER_SIZE-1) as UIView, belowSubview: loadedCards.objectAtIndex(MAX_BUFFER_SIZE-2) as UIView)
        }
    }
    
    func swipeRight() {
        var dragView: DraggableView = loadedCards.firstObject as DraggableView
        dragView.overlayView!.mode = GGOverlayViewMode.Right
        UIView.animateWithDuration(0.2, animations: {
            dragView.overlayView!.alpha = 1
        })
        dragView.rightClickAction()
    }
    
    func swipeLeft() {
        var dragView: DraggableView = loadedCards.firstObject as DraggableView
        dragView.overlayView!.mode = GGOverlayViewMode.Left
        UIView.animateWithDuration(0.2, animations: {
            dragView.overlayView!.alpha = 1
        })
        dragView.leftClickAction()
    }
}

