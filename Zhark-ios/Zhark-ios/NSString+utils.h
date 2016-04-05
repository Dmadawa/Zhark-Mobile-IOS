//
//  NSString+utils.h
//  Zhark-ios
//
//  Created by Dushan Madawa on 3/14/16.
//  Copyright © 2016 Dushan Madawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(utils)


- (NSString *)trimWhiteSpace;

- (BOOL)isValidEmail;

- (BOOL)isNotEmpty;

@end
