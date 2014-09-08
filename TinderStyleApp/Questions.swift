//
//  Questions.swift
//  TinderStyleApp
//
//  Created by kiiita on 2014/09/06.
//  Copyright (c) 2014年 kiiita. All rights reserved.
//

import Foundation

struct questionGroupA {
    var questionsList : [String]
    var answerWhenYes: String
    var answerWhenNo: String
    var group: String
                         
    init() {
        self.questionsList = ["a1", "a2"]
        self.answerWhenYes = "OK"
        self.answerWhenNo = "NG"
        self.group = "groupA"
    }
}

struct questionGroupB {
    var questionsList : [String]
    var answerWhenYes: String
    var answerWhenNo: String
                         
    init() {
        self.questionsList = ["b1", "b2"]
        self.answerWhenYes = "OK"
        self.answerWhenNo = "NG"
    }
}

struct questionGroupC {
    var questionsList : [String]
    var answerWhenYes: String
    var answerWhenNo: String
                         
    init() {
        self.questionsList = ["c1", "c2"]
        self.answerWhenYes = "OK"
        self.answerWhenNo = "NG"
    }
}

struct questionGroupD {
    var questionsList : [String]
    var answerWhenYes: String
    var answerWhenNo: String
                         
    init() {
        self.questionsList = ["d1", "d2"]
        self.answerWhenYes = "OK"
        self.answerWhenNo = "NG"
    }
}

struct questionGroupE {
    var questionList: [[String]]
    init() {
        self.questionList = [
            ["a1", "a2"],
            ["b1", "b2"],
            ["c1", "c2"],
        ]
    }
}