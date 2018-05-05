//
//  EmptyView.swift
//  UITableViewPractice
//
//  Created by 梶田悠 on 2018/04/29.
//  Copyright © 2018年 Haruka Kajita. All rights reserved.
//

import UIKit

class EmptyView: UIView {
    
    var reloadButton:UIButton?
    let baseColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.4)
    
    //EmptyViewのrectと更新ボタンの使用の有無をboolで受け取るコンストラクタ
    init(frame: CGRect, useRefreshButton: Bool) {
        super.init(frame: frame)
        
        self.backgroundColor = baseColor
        //CustomtableViewが十分な大きさを確保できていないとemptyViewのラベルとボタンのレイアウトが崩れる可能性がある
        let infoLabel = UILabel(frame: CGRect(x: 0, y: 100, width: self.frame.width, height: 100))
        infoLabel.text = "取得できる情報がありませんでした。"
        infoLabel.textAlignment = .center
        infoLabel.textColor = UIColor.white
        self.addSubview(infoLabel)
        
        //更新ボタンを使う場合の処理↓↓↓
        if useRefreshButton{
            reloadButton = UIButton()
            reloadButton?.frame.size = CGSize(width: 80, height: 40)
            reloadButton?.center.x = self.center.x
            reloadButton?.frame.origin.y = infoLabel.frame.maxY + 20
            reloadButton?.setTitle("更新", for: .normal)
            reloadButton?.titleLabel?.textColor = UIColor.white
            reloadButton?.backgroundColor = baseColor
            reloadButton?.backgroundColor?.withAlphaComponent(0.5)
            self.addSubview(reloadButton!)
        }
    }
    
    //IBからの使用は考慮しない(CustomTableViewからしか作成されないと思うので)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
}
