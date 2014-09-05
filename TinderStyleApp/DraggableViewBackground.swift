//
//  DraggableViewBackground.swift
//  TinderStyleApp
//
//  Created by kiiita on 2014/09/01.
//  Copyright (c) 2014年 kiiita. All rights reserved.
//

import Foundation
import UIKit

//var questionList: [String: String] = ["groupA":"1","groupA":"2","groupA":"3","groupB":"4","groupB":"5","groupB":"6","groupB":"7","groupC":"8","groupC":"9","groupD":"10"]

//struct A {
//    var hoge : [String]
//    var yesAnswer: String
//    var noAnswer: String
//    
//    init() {
//    var hoge : [String] = ["a1", "a2"]
//    var yesAnswer: String = "OK"
//    var noAnswer: String = "NG"
//    }
//    
//}



class DraggableViewBackground: UIView, DraggableViewDelegate{
    
//    var aaa = A()
//    println(aaa)
    
    
    var cardsLoadedIndex:Int = Int()
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
    var result: UILabel = UILabel()
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.layoutSubviews()
        self.setupView()
        
        exampleCardLabels = ["夢に彼氏が出てきた？", "彼氏とおはようの挨拶はした？", "浮気が心配。。。", "もうすぐ彼との記念日？", "昨日寝る前におやすみは言った？"]
        loadedCards = []
        cardsLoadedIndex = 0
        self.loadCards()
    }
    
    func setupView() {
        self.backgroundColor = UIColor(red: 0.529, green: 0.809, blue: 0.98, alpha: 1.0);
        menuButton = UIButton(frame:CGRectMake(17,34,22,15))
        messageButton = UIButton(frame:CGRectMake(284,34,18,18))
        xButton = UIButton(frame:CGRectMake(60,485,59,59))
        checkButton = UIButton(frame:CGRectMake(200,485,59,59));
//        result = UILabel(frame:CGRectMake(self.bounds.size.width - 100 / 2, self.bounds.size.height - 100 / 2, self.frame.size.width, 100))
        result = UILabel(frame:CGRectMake(60, 200, 200, 100))
        result.numberOfLines = 0
        result.text = "result!"
        let menuButtonImage = UIImage(named: "menuButton")
        let messageButtonImage = UIImage(named: "messageButton")
        let xButtonImage = UIImage(named: "xButton")
        let checkButtonImage = UIImage(named: "checkButton")
        menuButton.setImage(menuButtonImage, forState: UIControlState.Normal)
        messageButton.setImage(messageButtonImage, forState: UIControlState.Normal)
        xButton.setImage(xButtonImage, forState: UIControlState.Normal)
        checkButton.setImage(checkButtonImage, forState: UIControlState.Normal)
        xButton.addTarget(self, action: "swipeLeft", forControlEvents: .TouchUpInside)
        checkButton.addTarget(self, action: "swipeRight", forControlEvents: .TouchUpInside)
        self.addSubview(menuButton)
        self.addSubview(messageButton)
        self.addSubview(xButton)
        self.addSubview(checkButton)
        self.addSubview(result)
    }
    
    func createDraggableViewWithDataAtIndex(index: Int) -> DraggableView {
        var draggableView: DraggableView = DraggableView(frame:CGRectMake(30, 100, CARD_WIDTH, CARD_HEIGHT))
        draggableView.information.text = exampleCardLabels.objectAtIndex(index) as? String
        draggableView.backgroundColor = UIColor.whiteColor()
        draggableView.delegate = self
        return draggableView
    }
    
    func loadCards() {
        if (exampleCardLabels.count > 0) {
            var numLoadedCardsCap = ((exampleCardLabels.count > MAX_BUFFER_SIZE) ? MAX_BUFFER_SIZE : exampleCardLabels.count )
            
            for i in 0..<exampleCardLabels.count {
                var newCard: DraggableView = self.createDraggableViewWithDataAtIndex(i)
                allCards.addObject(newCard)
                if (i < numLoadedCardsCap) {
                    loadedCards.addObject(newCard)
                }
            }
            
            for i in 0..<loadedCards.count {
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
        if (cardsLoadedIndex == 5) {
            self.result.text = "あんまり調子に乗らず\n大人しくしとこう"
        }
    }
    
    func cardSwipedRight(card: UIView) {
        loadedCards.removeObjectAtIndex(0)
        if ( cardsLoadedIndex < allCards.count ) {
            loadedCards.addObject(allCards.objectAtIndex(cardsLoadedIndex))
            cardsLoadedIndex++
            self.insertSubview(loadedCards.objectAtIndex(MAX_BUFFER_SIZE-1) as UIView, belowSubview: loadedCards.objectAtIndex(MAX_BUFFER_SIZE-2) as UIView)
        }
        if (cardsLoadedIndex == 5) {
            self.result.text = "きっと今日は彼氏と\nいいコトがあるはず...♡"
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
