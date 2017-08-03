//
//  LZMessageViewController.swift
//  LZWeChat
//
//  Created by lingzhi on 2017/6/22.
//  Copyright © 2017年 lingzhi. All rights reserved.
//

import UIKit

class LZMessageViewController: LZBaseViewController,UITableViewDelegate,UITableViewDataSource {

    /**
     *fileprivate: 使用 fileprivate 来把接口暴露到类的内部(因为文件内大部分情况下都只会有一个类)
     */
     var tableView : UITableView?
   
    
    var actionFloatView: LZMessageActionFloatView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.viewBackgroundColor
        
        
        self.tableView = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.plain)
        self.tableView?.backgroundColor = UIColor.red
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.view.addSubview(self.tableView!)
        
        
        self.navigationItem.rightButtonAction(UIImage.init(named: "barbuttonicon_add")!){
            (Void) -> Void in
            self.actionFloatView.hide(!self.actionFloatView.isHidden)
        }
        
        self.actionFloatView = LZMessageActionFloatView()
//        self.actionFloatView.delegate = self
        self.view.addSubview(self.actionFloatView)
        self.actionFloatView.snp.makeConstraints { (make)-> Void in
            make.edges.equalTo(UIEdgeInsetsMake(64, 0, 0, 0))
    
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCell(withIdentifier: "SwiftCell")
        if (cell == nil) {
        cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "SwiftCell")
        }
        cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell?.textLabel?.text = "凌志"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
