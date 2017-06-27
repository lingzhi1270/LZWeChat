//
//  LZTabbarViewController.swift
//  LZWeChat
//
//  Created by lingzhi on 2017/6/21.
//  Copyright © 2017年 lingzhi. All rights reserved.
//

import UIKit
import TimedSilver
import Cent
class LZTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewController()
    }
    
    func setupViewController() {
        let titleArray = ["微信","通讯录","发现","我"]
        
        let normalImagesArray = [
        UIImage.init(named: "tabbar_mainframe"),
        UIImage.init(named: "tabbar_contacts"),
        UIImage.init(named: "tabbar_discover"),
        UIImage.init(named: "tabbar_me")
        ]
        
        
        let selectedImagesArray = [
            UIImage.init(named: "tabbar_mainframeHL"),
            UIImage.init(named: "tabbar_contactsHL"),
            UIImage.init(named: "tabbar_discoverHL"),
            UIImage.init(named: "tabbar_meHL")
        ]
        
        let viewControllerArray = [
      LZMessageViewController.ts_initFromNib(),
      LZContactViewController.ts_initFromNib(),
      LZDiscoverViewController.ts_initFromNib(),
      LZMeViewController.ts_initFromNib()

        ]
        
        let navigationVCArray = NSMutableArray()
        for (index, controller) in viewControllerArray.enumerated() {
            //添加标题
            controller.title = titleArray.get(index:index)
            controller.tabBarItem!.title = titleArray.get(index:index)
            controller.tabBarItem!.image = normalImagesArray.get(index: index)
            controller.tabBarItem!.selectedImage = selectedImagesArray.get(index: index)
           
            
            controller.tabBarItem!.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.lightGray], for: UIControlState())
            
            controller.tabBarItem!.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.blue], for: .selected)
            
            let navigationController = LZNavigationController(rootViewController:controller)
            navigationVCArray.add(navigationController)
            
            
        }
        self.viewControllers = navigationVCArray.mutableCopy() as! [UINavigationController]
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
