//
//  userService.h
//  Zhark-ios
//
//  Created by Dushan Madawa on 3/14/16.
//  Copyright © 2016 Dushan Madawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIClient.h"

@interface userService : NSObject

+(AFHTTPRequestOperation *)getAuthTokenWithUserName:(NSString *)name andPassword:(NSString *)password os:(NSString *)osStr
                                               udid:(NSString *)strUDID version:(NSString *)version mob:(NSString *)mobile withBlock:(void (^)(NSString *authToken, NSError *error))block;

@end
