//
//  ViewController.swift
//  jifenqi
//
//  Created by 20131105755 on 16/4/18.
//  Copyright © 2016年 20131105755. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var db :SQLiteDB!

    override func viewDidLoad() {
        super.viewDidLoad()
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        //如果有数据则加载
        initUser()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //从SQLite加载数据
    @IBAction func saveClicked(sender: AnyObject) {
        saveUser()
    }
    func initUser() {
        let data = db.query("select * from t_user")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            lable1.text = user["uname"] as? String
            lable2.text = user["mobile"] as? String
        }
    }
    
    //保存数据到SQLite
    func saveUser() {
        let uname = self.lable1.text!
        let mobile = self.lable2.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_user(uname,mobile) values('\(uname)','\(mobile)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
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

