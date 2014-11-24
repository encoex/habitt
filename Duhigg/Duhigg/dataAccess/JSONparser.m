//
//  JSONparser.m
//  Duhigg
//
//  Created by Yigit Can Arin on 11/20/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import "JSONparser.h"
#import "HabitCategory.h"
#import "HabitGoal.h"
#import "HabitSubscription.h"

@implementation JSONparser

+(NSArray *)subscriptionsFromJson:(NSData *)objectNotation
                         error:(NSError **)error
{
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil)
    {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *subscriptions = [NSMutableArray new];
    
    NSArray *results = [parsedObject valueForKey:@"subs"];
    
    for (NSDictionary *categoryDict in results)
    {
        HabitSubscription *subscription = [HabitSubscription new];
        
        for (NSString *key in categoryDict)
        {
            if ([subscription respondsToSelector:NSSelectorFromString(key)])
            {
                [subscription setValue:[categoryDict valueForKey:key] forKey:key];
            }
        }
        
        [subscriptions addObject:subscription];
    }
    
    return subscriptions;
}

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

+(NSArray *)goalsFromJson:(NSData *)objectNotation
                    error:(NSError **)error
{
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil)
    {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *goals = [NSMutableArray new];
    
    NSArray *results = [parsedObject valueForKey:@"goals"];

    for (NSDictionary *resutlsDict in results)
    {
        HabitGoal *goal = [HabitGoal new];
        
        for (NSString *key in resutlsDict)
        {
            if ([goal respondsToSelector:NSSelectorFromString(key)])
            {
                [goal setValue:[resutlsDict valueForKey:key] forKey:key];
            }
        }
        
        [goals addObject:goal];
    }
    
    return goals;
}

@end
