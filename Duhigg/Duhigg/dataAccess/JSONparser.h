//
//  JSONparser.h
//  Duhigg
//
//  Created by Yigit Can Arin on 11/20/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONparser : NSObject

+(NSArray *)categoriesFromJson:(NSData *)objectNotation
                         error:(NSError **)error;

+(NSArray *)goalsFromJson:(NSData *)objectNotation
                         error:(NSError **)error;
@end
