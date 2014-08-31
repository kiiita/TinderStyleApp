//
//  DraggableViewBackground.h
//  TinderStyleApp
//
//  Created by kiiita on 2014/08/30.
//  Copyright (c) 2014年 kiiita. All rights reserved.
//

#ifndef TinderStyleApp_DraggableViewBackground_h
#define TinderStyleApp_DraggableViewBackground_h


#import <UIKit/UIKit.h>
#import "DraggableView.h"

@interface DraggableViewBackground : UIView <DraggableViewDelegate>

//methods called in DraggableView
-(void)cardSwipedLeft:(UIView *)card;
-(void)cardSwipedRight:(UIView *)card;

@property (retain,nonatomic)NSArray* exampleCardLabels; //%%% the labels the cards
@property (retain,nonatomic)NSMutableArray* allCards; //%%% the labels the cards


@end


#endif
