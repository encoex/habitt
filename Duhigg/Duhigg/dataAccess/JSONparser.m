//
//  JSONparser.m
//  Duhigg
//
//  Created by Yigit Can Arin on 11/20/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import "JSONparser.h"
#import "HabitCategory.h"

@implementation JSONparser

+(NSArray *)categoriesFromJson:(NSData *)objectNotation
                         error:(NSError **)error
{
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil)
    {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *categories = [NSMutableArray new];
    
    NSArray *results = [parsedObject valueForKey:@"categories"];
    //NSLog(@"Count %d",results.count);
    
    for (NSDictionary *categoryDict in results)
    {
        HabitCategory *category = [HabitCategory new];
        
        for (NSString *key in categoryDict)
        {
            if ([category respondsToSelector:NSSelectorFromString(key)])
            {
                [category setValue:[categoryDict valueForKey:key] forKey:key];
            }
        }
        
        [categories addObject:category];
    }
    
    return categories;
}

@end
