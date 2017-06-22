//
//  LZMessageViewController.swift
//  LZWeChat
//
//  Created by lingzhi on 2017/6/21.
//  Copyright © 2017年 lingzhi. All rights reserved.
//

import UIKit

class LZMessageViewController: LZBaseViewController {

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    //添加导航标题
    self.navigationController?.navigationBar.topItem?.title = "消息"
    
    self.view!.backgroundColor = UIColor.gray
        
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
