//
//  Extension.swift
//  TinderStyleApp
//
//  Created by kiiita on 2014/09/06.
//  Copyright (c) 2014年 kiiita. All rights reserved.
//

import Foundation

extension Array {
    mutating func shuffle(count: Int) {
        for _ in 0..<count {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}

extension NSMutableArray {
    func shuffle(count: Int) {
        for i in 0..<count {
            var nElements: Int = count - i
            var n: Int = Int(arc4random_uniform(UInt32(nElements))) + i
            self.exchangeObjectAtIndex(i, withObjectAtIndex: n)
        }
    }

}