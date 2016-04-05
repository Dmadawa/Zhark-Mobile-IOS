//
//  ViewController.m
//  Zhark-ios
//
//  Created by Dushan Madawa on 3/10/16.
//  Copyright © 2016 Dushan Madawa. All rights reserved.
//

#import "ViewController.h"
#import "userService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doLogin:(id)sender {
    NSString* Identifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSLog(@"AppID%@",Identifier);
    
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"version%@",version);
    
    [userService getAuthTokenWithUserName:self.txtUserName.text andPassword:self.txtPassword.text os:@"ios" udid:Identifier  version:version mob:@"true" withBlock:^(NSString *authToken, NSError *error) {
        
        
        
        
        
        
        
    }];
}
 
@end
