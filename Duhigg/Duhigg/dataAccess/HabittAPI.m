//
//  HabittAPI.m
//  Duhigg
//
//  Created by Yigit Can Arin on 11/20/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import "HabittAPI.h"
#import "HabitCategory.h"
#import "HabitGoal.h"

@implementation HabittAPI


- (void)getGoals
{
    NSString *categoriesUrl = @"http://habitt04.appspot.com/goals";
    NSURL *url = [[NSURL alloc]initWithString:categoriesUrl];
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url]
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if (error)
         {
             [self.delegate fetchingDataFailedWithError:error];
         }
         else
         {
             // here we need to pass the object type
             // receiveJson should be a generic method
             [self.delegate receiveJsonData:data object:[HabitGoal new]];
         }
     }];
}

- (void)getCategories
{
    NSString *categoriesUrl = @"http://habitt04.appspot.com/categories";
    NSURL *url = [[NSURL alloc]initWithString:categoriesUrl];
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url]
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
    {
        if (error)
        {
            [self.delegate fetchingDataFailedWithError:error];
        }
        else
        {
            [self.delegate receiveJsonData:data object:[HabitCategory new]];
        }
    }];
}



@end
