//
//  InterfaceController.swift
//  watchExample Extension
//
//  Created by Dushan Madawa on 3/25/16.
//  Copyright © 2016 Dushan Madawa. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var tblMain: WKInterfaceTable!
    
    var emojis=["😍","👺","😦","🚗"]
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        self.tblMain.setNumberOfRows(self.emojis.count, withRowType: "tblRow")
        
        for indexno in 0..<self.emojis.count{
            
            let theRow=self.tblMain.rowControllerAtIndex(indexno) as! tblRow
            
            theRow.lblOne.setText(self.emojis[indexno]);
        
            
            
        }
        
        // Configure interface objects here.
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        
        self.pushControllerWithName("pushTo", context: self.emojis[rowIndex])
        
    }

}
