//
//  DataProvider.m
//  Duhigg
//
//  Created by Yigit Can Arin on 11/20/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import "DataProvider.h"
#import "JSONparser.h"


@implementation DataProvider

-(void)fetchCategories
{
    [self.communicator getCategories];
}

#pragma HabitAPI Delegate Methods

- (void)receiveCategoriesJSON:(NSData *)objectNotation
{
    NSError *error = nil;
    NSArray *groups = [JSONparser categoriesFromJson:objectNotation error:&error];
    
    if (error != nil)
    {
        [self.delegate fetchingCategoriesFailedWithError:error];
    }
    
    else
    {
        [self.delegate didReceiveCategories:groups];
    }

}

- (void)fetchingCategoriesFailedWithError:(NSError *)error
{
    [self.delegate fetchingCategoriesFailedWithError:error];
}

@end
