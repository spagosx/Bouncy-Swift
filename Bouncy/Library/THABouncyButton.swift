//
//  THABouncyButton.swift
//  Think Animals
//
//  Created by Daniele Spagnolo on 08/11/2015.
//  Copyright © 2015 vadago. All rights reserved.
//

import UIKit

@IBDesignable class THABouncyButton: UIButton {
    
    @IBInspectable var delayAction: Bool = false
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.sendActionsForControlEvents(.TouchDown)
        self.shrink()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if !delayAction { self.sendActionsForControlEvents(.TouchUpInside) }
        self.bounce({
            if self.delayAction { self.sendActionsForControlEvents(.TouchUpInside) }
        })
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        if let _ = touches {
            self.touchesEnded(touches!, withEvent: event)
        }
    }

}
