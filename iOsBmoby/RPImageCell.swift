//
//  RPImageCell.h
//
//  Created by Renato Peterman on 17/08/14.
//  Copyright (c) 2014 Renato Peterman. All rights reserved.
//
import UIKit
class RPImageCell: UICollectionViewCell {
    var text: UILabel!

    var backgroundImageView: UIImageView!

    func styleImage() {
        text.hidden = true
        if !self.isSelected() {
            self.layer.borderWidth = 0.0
            self.layer.borderColor = UIColor.clear.cgColor
        }
    }

    func styleAddButton() {
        text.hidden = false
        self.layer.borderWidth = 3.0
        self.layer.borderColor = UIColor(red: 0.26, green: 0.26, blue: 0.26, alpha: 1.0).cgColor
    }


    override init(frame: CGRect) {
        super.init(frame)
        
        self.backgroundColor = UIColor.darkGray
        // Image View
        self.backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.backgroundImageView.backgroundColor = UIColor.clear
        self.backgroundImageView.contentMode = .scaleAspectFit
        self.addSubview(self.backgroundImageView)
        // Label Add
        text = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
        text.textAlignment = .center
        text.text = "+"
        text.font = UIFont.systemFontOfSize(32.0)
        text.textColor = UIColor(red: 0.0, green: 150.0 / 255.0, blue: 1.0, alpha: 1.0)
        text.backgroundColor = UIColor.clear
        text.hidden = true
        self.addSubview(text)
    
    }

    override func setSelected(_ selected: Bool) {
        if selected {
            self.layer.borderColor = UIColor(red: 0.0, green: 150.0 / 255.0, blue: 1.0, alpha: 1.0).cgColor
            self.layer.borderWidth = 3.0
        }
        else {
            self.layer.borderColor = UIColor.clear.cgColor
            self.layer.borderWidth = 0.0
        }
    }
}
//
//  RPImageCell.m
//
//  Created by Renato Peterman on 17/08/14.
//  Copyright (c) 2014 Renato Peterman. All rights reserved.
//