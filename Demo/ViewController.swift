//
//  ViewController.swift
//  Bouncy-Swift
//
//  Created by Daniele Spagnolo on 08/11/2015.
//  Copyright © 2015 spagosx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel?
    @IBOutlet var bouncyView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeText(sender: AnyObject) {
        let string1 = "some text"
        let string2 = "other text"
        
        let text = label?.text == string1 ? string2 : string1
        label?.text = text
        
        bouncyView?.bounce({
            let color = self.bouncyView?.backgroundColor == UIColor.redColor() ?
                UIColor.blueColor() :
                UIColor.redColor()
            self.bouncyView?.backgroundColor = color
        })
    }
}

