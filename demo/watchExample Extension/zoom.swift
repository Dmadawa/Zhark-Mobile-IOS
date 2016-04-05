//
//  zoom.swift
//  demo
//
//  Created by Dushan Madawa on 3/27/16.
//  Copyright © 2016 Dushan Madawa. All rights reserved.
//

import WatchKit
import Foundation


class zoom: WKInterfaceController {

    @IBOutlet var lblZoom: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        let emoji=context as! String
        
        let font=UIFont.systemFontOfSize(90)
        
        let specialString=NSAttributedString(string: emoji, attributes: [NSFontAttributeName:font])
        
        self.lblZoom.setAttributedText(specialString)
        
        
        
        //self.lblZoom.setText(emoji);
        
        
        // Configure interface objects here.
    }
    
    
}
