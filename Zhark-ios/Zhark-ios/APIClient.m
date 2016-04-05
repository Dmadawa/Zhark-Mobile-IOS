//
//  APIClient.m
//  Slice
//
//  Created by Inoka Dissanayake on 7/28/15.
//  Copyright (c) 2015 MyCompany. All rights reserved.
//

#import "APIClient.h"


//Production url

//#define BASE_URL @"http://ec2-52-26-108-180.us-west-2.compute.amazonaws.com:8000/"

// Staging url

//#define BASE_URL @"http://ec2-52-30-123-189.eu-west-1.compute.amazonaws.com:8000/"

#define BASE_URL @"http://192.168.2.104:3000/auth/"


//#define BASE_URL @"https://ec2-52-30-123-189.eu-west-1.compute.amazonaws.com/"

@implementation APIClient

+ (instancetype)sharedClient {
    static APIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[APIClient alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
        _sharedClient.securityPolicy.allowInvalidCertificates = YES;
        
    });
    
    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    
    if (self) {
        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        
        [self setResponseSerializer:responseSerializer];
        
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content Type"];
        
        
        [self.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil]];
        
        self.requestSerializer.timeoutInterval = 60;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(HTTPOperationDidFinish:) name:AFNetworkingOperationDidFinishNotification object:nil];
        
       
        
    }
    
    return self;
}

//-(void)injectAutherizationHeader {
//    NSLog(@"auth token - %@", [User getAuthToken]);
////    if ([User hasAuthenticated]) {
////        [User getAuthToken];
////    }
//    //NSString *authTokenParam = [NSString stringWithFormat:@"Token %@", @"d9ce4c9da547d1d404e62e121811db03936377"];
//    NSString *authTokenParam = [NSString stringWithFormat:@"Token %@", [User getAuthToken]];
//    if ([User getAuthToken]==NULL) {
//        authTokenParam=@"";
//    }
//    NSLog(@"Autherization header - %@", authTokenParam);
//    
//    [[APIClient sharedClient].requestSerializer setValue:authTokenParam forHTTPHeaderField:@"Authorization"];
//    
//    
//}

- (void)HTTPOperationDidFinish:(NSNotification *)notification {
    NSLog(@"HTTPOperationDidFinish");
    
    AFHTTPRequestOperation *operation = (AFHTTPRequestOperation *)[notification object];
    if ([operation.response statusCode] == 401) {
    
        // enqueue a new request operation here
        NSLog(@"401 received.");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"LogoutNotification" object:nil];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"" password:@""];
        [manager.securityPolicy setAllowInvalidCertificates:YES];
        
        [manager.securityPolicy setValidatesDomainName:NO];
    }
}

@end
