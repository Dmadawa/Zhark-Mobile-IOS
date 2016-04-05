//
//  ViewController.h
//  Zhark-ios
//
//  Created by Dushan Madawa on 3/10/16.
//  Copyright © 2016 Dushan Madawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController
- (IBAction)doLogin:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtUserName;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;


@end

