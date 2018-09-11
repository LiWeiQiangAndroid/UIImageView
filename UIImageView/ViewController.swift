//
//  ViewController.swift
//  UIImageView
//
//  Created by 李维强 on 2018/9/11.
//  Copyright © 2018 李维强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var birdImageView:UIImageView?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "image")
        let imageview = UIImageView(image: image)
        
        imageview.frame = CGRect(x: 30, y: 30, width: 200, height: 200)
        self.view.addSubview(imageview)
        
        var imageArray = Array<UIImage?>()
        for index in 1...8 {
            let birdImage = UIImage(named: "bird\(index)")
            imageArray.append(birdImage)
        }
        
        //UIImageView的动画设置
        birdImageView = UIImageView(frame: CGRect(x: 30, y: 250, width: 200, height: 100))
        
        //设置动画数组
        birdImageView?.image = imageArray.first as? UIImage
        birdImageView!.animationImages = imageArray as? [UIImage]
        
        //设置动画播放一轮的时间
        birdImageView!.animationDuration = 1
        
        //设置播放次数
        birdImageView!.animationRepeatCount = 0
        self.view.addSubview(birdImageView!)
        
        //播放动画方法
        birdImageView!.startAnimating()
        
        let button = UIButton(type: UIButtonType.system)
        button.frame = CGRect(x: 30, y: 370, width: 80, height: 30)
        button.setTitle("停止", for: UIControlState())
        self.view.addSubview(button)
        
        button.addTarget(self, action: #selector(stopFly), for: UIControlEvents.touchUpInside)
    }

    
    @objc func stopFly() {
        
        birdImageView?.stopAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

