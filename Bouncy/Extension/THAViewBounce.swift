//
//  THAViewBounce.swift
//  Think Animals
//
//  Created by Daniele Spagnolo on 08/11/2015.
//  Copyright © 2015 vadago. All rights reserved.
//

import UIKit

private var durationKey: UInt8 = 0
private var delayKey: UInt8 = 0
private var dampingKey: UInt8 = 0
private var springKey: UInt8 = 0
private var downScaleKey: UInt8 = 0
private var downDurationKey: UInt8 = 0

public extension UIView {
    
    @IBInspectable var duration: Double {
        get {
            if let obj: Double = associatedObject(self, key: &durationKey) as? Double {return obj}
            return Double(0)
        }
        set { associateObject(self, key: &durationKey, value: newValue) }
    }
    
    @IBInspectable var delay: Double {
        get {
            if let obj: Double = associatedObject(self, key: &delayKey) as? Double {return obj}
            return Double(0)
        }
        set { associateObject(self, key: &delayKey, value: newValue) }
    }
    
    @IBInspectable var damping: CGFloat {
        get {
            if let obj: CGFloat = associatedObject(self, key: &dampingKey) as? CGFloat {return obj}
            return 0.0
        }
        set { associateObject(self, key: &dampingKey, value: newValue) }
    }
    
    @IBInspectable var springVelocity: CGFloat {
        get {
            if let obj: CGFloat = associatedObject(self, key: &springKey) as? CGFloat {return obj}
            return 0.0
        }
        set {
            associateObject(self, key: &springKey, value: newValue)
        }
    }
    
    @IBInspectable var downScaleFactor: CGFloat {
        get {
            if let obj: CGFloat = associatedObject(self, key: &downScaleKey) as? CGFloat {return obj}
            return 0.0
        }
        set { associateObject(self, key: &downScaleKey, value: newValue) }
    }
    
    @IBInspectable var downDuration: Double {
        get {
            if let obj: Double = associatedObject(self, key: &downDurationKey) as? Double {return obj}
            return Double(0)
        }
        set { associateObject(self, key: &downDurationKey, value: newValue) }
    }
    
    
    internal func shrink() {
        UIView.animateWithDuration(downDuration) {
            self.layer.transform = CATransform3DMakeScale(self.downScaleFactor, self.downScaleFactor, 1)
        }
    }
    
    public func bounce(endAction: (()->())?) {
        shrink()
        
        UIView.animateWithDuration(duration, delay: delay,
            usingSpringWithDamping: damping,
            initialSpringVelocity: springVelocity,
            options: [],
            animations: {
                self.transform = CGAffineTransformIdentity
            }, completion:{ (finished: Bool) in
                endAction?()
        })
    }
    
}
