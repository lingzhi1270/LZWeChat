//
//  LZMessageActionFloatView.swift
//  LZWeChat
//
//  Created by lingzhi on 2017/6/22.
//  Copyright © 2017年 lingzhi. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit
import RxCocoa

private let kActionViewWidth: CGFloat = 140

private let kActionViewHeight: CGFloat = 190

private let kActionButtonHeight: CGFloat = 44

private let kFirstButtonY : CGFloat = 12

class LZMessageActionFloatView: UIView {

    weak var delegate: ActionFloatViewDelegate?
    let disposeBag = DisposeBag()
    
    override init (frame :CGRect){
        super.init(frame :frame)
        self.initContent()
        
    }
    
    convenience init(){
        self.init(frame: CGRect.zero)
        self.initContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
     fileprivate func initContent(){
    
        self.backgroundColor = UIColor.clear
        let actionImages = [
        UIImage.init(named: "contacts_add_newmessage"),
        UIImage.init(named: "barbuttonicon_add_cube"),
        UIImage.init(named: "contacts_add_scan"),
        UIImage.init(named: "receipt_payment_icon")
        
        ]
        
        let actionTitles = [
        "发起群聊",
        "添加朋友",
        "扫一扫",
        "收付款",
        ]

        let containerView : UIView = UIView()
        containerView.backgroundColor = UIColor.clear
        self.addSubview(containerView)
        containerView.snp.makeConstraints { (make)->Void in
            
            make.top.equalTo(self.snp.top).offset(3)
            make.right.equalTo(self.snp.right).offset(-5)
            make.width.equalTo(kActionViewWidth)
            make.height.equalTo(kActionViewHeight)
          
        }
        
        
        //初始化背景图片
        let stretchInsets = UIEdgeInsetsMake(14, 6, 6, 34)
        let bubbleMaskImage = UIImage.init(named: "MessageRightTopBg")?.resizableImage(withCapInsets: stretchInsets,resizingMode:.stretch)
        let bgImageView:UIImageView = UIImageView(image:bubbleMaskImage)
        containerView.addSubview(bgImageView)
        bgImageView.snp.makeConstraints { (make)->Void in
            make.edges.equalTo(containerView)
        }
        
        //初始化自定义按钮
        var yValue = kFirstButtonY
        for index in 0 ..< actionImages.count {
            let itemButton: UIButton = UIButton(type: .custom)
            itemButton.titleLabel!.font = UIFont.systemFont(ofSize: 17)
            itemButton.setTitleColor(UIColor.white, for: UIControlState())
            itemButton.setTitleColor(UIColor.white, for: .highlighted)
            itemButton.setTitle(actionTitles.get(index: index), for: .normal)
            itemButton.setTitle(actionTitles.get(index: index), for: .highlighted)
            itemButton.setImage(actionImages.get(index: index), for: .normal)
            itemButton.setImage(actionImages.get(index: index), for: .highlighted)
            itemButton.addTarget(self, action: #selector(LZMessageActionFloatView.buttonTap(_:)), for: UIControlEvents.touchUpInside)
            
            itemButton.contentHorizontalAlignment = .left
            itemButton.contentEdgeInsets = UIEdgeInsetsMake(0, 12, 0, 0)
            itemButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
            itemButton.tag = index
            
            containerView.addSubview(itemButton)
            
            itemButton.snp.makeConstraints{ (make)-> Void in
                make.top.equalTo(containerView.snp.top).offset(yValue)
                make.right.equalTo(containerView.snp.right)
                make.width.equalTo(containerView.snp.width)
                make.height.equalTo(kActionViewHeight)
            }
            yValue += kActionViewHeight
        }
        
        let tap = UITapGestureRecognizer()
        self.addGestureRecognizer(tap)
        tap.rx.event.subscribe { _ in
            self.hide(true)
            }.addDisposableTo(self.disposeBag)
        
        self.isHidden = true
    }

    
    
    func buttonTap(_ sender:UIButton!){
        guard let delegate = self.delegate else{
            self.hide(true)
            return
        }
        let type = ActionFloatViewItemType(rawValue:sender.tag)!
        delegate.floatViewTapItemIndex(type)
        self.hide(true)
        
        
        
    }
    
    
    func hide(_ hide:Bool){
        if hide {
            self.alpha = 1.0
            UIView.animate(withDuration: 0.2, animations: { 
                self.alpha = 0.0
            },
                           completion:{
                            finish in
                            self.isHidden = true
                            self.alpha = 1.0
            })
        }
        else
        {
           self.alpha = 1.0
           self.isHidden = false
        }
        
    }
    
    

}

//代理
protocol ActionFloatViewDelegate: class {
    
    func floatViewTapItemIndex(_ type:ActionFloatViewItemType)
}

//枚举
enum ActionFloatViewItemType: Int{
    case groupChat = 0, addFriend, scan, payment
}

