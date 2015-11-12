//
//  THABouncyLabel.swift
//  Think Animals
//
//  Created by Daniele Spagnolo on 08/11/2015.
//  Copyright © 2015 vadago. All rights reserved.
//

import UIKit

class THABouncyLabel: UILabel {

    override var text: String? {
        willSet {
            if self.text != newValue {
                self.bounce(nil)
            }
        }
    }
    
}
