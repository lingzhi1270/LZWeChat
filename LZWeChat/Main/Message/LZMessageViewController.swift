//
//  LZMessageViewController.swift
//  LZWeChat
//
//  Created by lingzhi on 2017/6/22.
//  Copyright © 2017年 lingzhi. All rights reserved.
//

import UIKit

class LZMessageViewController: LZBaseViewController {

    /**
     *fileprivate: 使用 fileprivate 来把接口暴露到类的内部(因为文件内大部分情况下都只会有一个类)
     */
    @IBOutlet fileprivate weak var tableView: UITableView!
   
    
    var actionFloatView: LZMessageActionFloatView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.viewBackgroundColor
        self.navigationItem.rightButtonAction(UIImage.init(named: "barbuttonicon_add")!){
            (Void)-> Void in self.actionFloatView.hide(!self.actionFloatView.isHidden)
        }
        
        self.actionFloatView = LZMessageActionFloatView()
//        self.actionFloatView.delegate = self
        self.view.addSubview(self.actionFloatView)
        self.actionFloatView.snp.makeConstraints { (make)-> Void in
            make.edges.equalTo(UIEdgeInsetsMake(64, 0, 0, 0))
            
            
        }
        
        
        
        
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
