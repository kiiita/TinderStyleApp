//
//  Extension.swift
//  TinderStyleApp
//
//  Created by kiiita on 2014/09/06.
//  Copyright (c) 2014年 kiiita. All rights reserved.
//

import Foundation

extension Array
    {
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for _ in 0..<8
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
