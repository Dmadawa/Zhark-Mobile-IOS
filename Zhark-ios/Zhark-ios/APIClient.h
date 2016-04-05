//
//  APIClient.h
//  Slice
//
//  Created by Inoka Dissanayake on 7/28/15.
//  Copyright (c) 2015 MyCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

@interface APIClient : AFHTTPRequestOperationManager

+ (instancetype)sharedClient;

-(void)injectAutherizationHeader;

@end
