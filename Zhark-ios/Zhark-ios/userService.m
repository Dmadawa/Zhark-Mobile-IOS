//
//  userService.m
//  Zhark-ios
//
//  Created by Dushan Madawa on 3/14/16.
//  Copyright © 2016 Dushan Madawa. All rights reserved.
//

#import "userService.h"

#define endpointGetToken @"login"



@implementation userService

+(AFHTTPRequestOperation *)getAuthTokenWithUserName:(NSString *)name andPassword:(NSString *)password os:(NSString *)osStr udid:(NSString *)strUDID version:(NSString *)version  mob:(NSString *)mobile withBlock:(void (^)(NSString *authToken, NSError *error))block {
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:name, @"username", password, @"password",osStr,@"os",strUDID,@"id",version,@"version",mobile,@"mobile", nil];
    NSLog(@"params -%@", params);
    
    NSLog(@"endpointGetToken%@",endpointGetToken);
    
    return [[APIClient sharedClient] POST:endpointGetToken parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"response - %@", responseObject);
        
        NSString *errorCode = [responseObject objectForKey:@"code"];
        
        
        if (errorCode) {
            NSString *message = [responseObject objectForKey:@"message"];
            NSError *error = [NSError errorWithDomain:@"com.slice" code:10 userInfo:[NSDictionary dictionaryWithObject:message forKey:NSLocalizedDescriptionKey]];
            block(nil, error);
        } else {
            NSString *token = [responseObject objectForKey:@"token"];
            //[User saveAuthToken:token];
            
            block(token, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSDictionary *responseObject = operation.responseObject;
        NSLog(@"error response - %@", responseObject);
        NSString *errorCode = [responseObject objectForKey:@"code"];
        
        
        
        if (errorCode) {
            NSString *message = [responseObject objectForKey:@"message"];
            NSError *error = [NSError errorWithDomain:@"com.slice" code:10 userInfo:[NSDictionary dictionaryWithObject:message forKey:NSLocalizedDescriptionKey]];
            block(nil, error);
        } else {
            NSString *message = @"Unknown error occurred.";
            NSError *error = [NSError errorWithDomain:@"com.slice" code:10 userInfo:[NSDictionary dictionaryWithObject:message forKey:NSLocalizedDescriptionKey]];
            block(nil, error);
        }
    }];
}



@end
