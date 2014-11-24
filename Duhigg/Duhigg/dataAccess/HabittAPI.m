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
#import "JSONparser.h"

// Fetches json and parses it and gives back to the Data Provider
// TO DO: Maybe parsing shouldnt be done here but this feels convenient for now.
@implementation HabittAPI

- (void)getSubscriptions
{
    
    NSString *urlString = @"http://habitt04.appspot.com/subscriptions";
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url]
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if (error)
         {
             //error occured while FETCHING json
             //TO DO: Throw specific exceptions ?
             [self.delegate fetchingDataFailedWithError:error];
         }
         else
         {
             NSArray *dataArray = nil;
             NSError *error = nil;
             dataArray = [JSONparser subscriptionsFromJson:data error:&error];
             
             if(error !=nil)
             {
                 //error occured while PARSING json
                 [self.delegate fetchingDataFailedWithError:error];
             }
             else
             {
                 [self.delegate receiveJsonData:dataArray];
             }
         }
     }];

}

- (void)getCategories
{
    NSString *urlString = @"http://habitt04.appspot.com/categories";
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url]
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if (error)
         {
             //error occured while FETCHING json
             //TO DO: Throw specific exceptions ?
             [self.delegate fetchingDataFailedWithError:error];
         }
         else
         {
             NSArray *dataArray = nil;
             NSError *error = nil;
             dataArray = [JSONparser categoriesFromJson:data error:&error];
             
             if(error !=nil)
             {
                 //error occured while PARSING json
                 [self.delegate fetchingDataFailedWithError:error];
             }
             else
             {
                 [self.delegate receiveJsonData:dataArray];
             }
         }
     }];
}

- (void)getGoals
{
    NSString *urlString = @"http://habitt04.appspot.com/goals";
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    
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
             NSArray *dataArray = nil;
             NSError *error = nil;
             dataArray = [JSONparser goalsFromJson:data error:&error];
             
             if(error !=nil)
             {
                 [self.delegate fetchingDataFailedWithError:error];
             }
             else
             {
                 [self.delegate receiveJsonData:dataArray];
             }
         }
     }];
}





@end
