//
//  THAObjCAssociation.swift
//  Think Animals
//
//  Created by Daniele Spagnolo on 08/11/2015.
//  Copyright © 2015 vadago. All rights reserved.
//

import Foundation

internal func associatedObject(
            object: AnyObject,
            key: UnsafePointer<UInt8>) -> AnyObject? {
        return objc_getAssociatedObject(object, key)
}

internal func associateObject(
            object: AnyObject,
            key: UnsafePointer<UInt8>,
            value: AnyObject) {
        objc_setAssociatedObject(object, key, value, .OBJC_ASSOCIATION_RETAIN)
}
