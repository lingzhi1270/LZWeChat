//
//  LZMessageViewController.swift
//  LZWeChat
//
//  Created by lingzhi on 2017/6/22.
//  Copyright © 2017年 lingzhi. All rights reserved.
//

import UIKit

class LZMessageViewController: LZBaseViewController,UITableViewDelegate,UITableViewDataSource{
    var tableView : UITableView?
    var actionFloatView: LZMessageActionFloatView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.plain)
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 50;
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let iderntify:String = "swiftCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: iderntify)
            if(cell == nil){
                cell=UITableViewCell(style: UITableViewCellStyle.default
                    , reuseIdentifier: iderntify);
                
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
        
    }
    
}
