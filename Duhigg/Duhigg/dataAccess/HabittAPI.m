//
//  HabittAPI.m
//  Duhigg
//
//  Created by Yigit Can Arin on 11/20/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import "HabittAPI.h"

@implementation HabittAPI


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
            [self.delegate fetchingCategoriesFailedWithError:error];
        }
        else
        {
            [self.delegate receiveCategoriesJSON:data];
        }
    }];
}



@end
