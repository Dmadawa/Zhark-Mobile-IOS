//
//  NSString+utils.m
//  Zhark-ios
//
//  Created by Dushan Madawa on 3/14/16.
//  Copyright © 2016 Dushan Madawa. All rights reserved.
//

#import "NSString+utils.h"

@implementation NSString(utils)


-(BOOL)isValidEmail{

      NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
      NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
      return [emailTest evaluateWithObject:self];
}

-(BOOL)isNotEmpty{
    
    return ![[self trimWhiteSpace] isEqualToString:[NSString string]];
    
}


-(NSString *)trimWhiteSpace{

   return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

}



@end
