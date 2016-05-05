//
//  ViewController.swift
//  jifenqi
//
//  Created by 20131105755 on 16/4/18.
//  Copyright © 2016年 20131105755. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add1(sender: AnyObject) {
        lable1.text=String(Int(lable1.text!)!+1)
    }

    @IBAction func add2(sender: AnyObject) {
        lable2.text=String(Int(lable2.text!)!+1)
    }

    @IBOutlet weak var lable1: UILabel!
    @IBOutlet weak var lable2: UILabel!
}

