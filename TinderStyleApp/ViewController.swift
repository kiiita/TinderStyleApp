//
//  ViewController.swift
//  TinderStyleApp
//
//  Created by kiiita on 2014/08/30.
//  Copyright (c) 2014年 kiiita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var draggableBackground = DraggableViewBackground(frame: self.view.frame)
        self.view.addSubview(draggableBackground)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

