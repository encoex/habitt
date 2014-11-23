//
//  DataProvider.m
//  Duhigg
//
//  Created by Yigit Can Arin on 11/20/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import "DataProvider.h"
#import "JSONparser.h"
#import "HabitGoal.h"
#import "HabitCategory.h"


@implementation DataProvider

-(void)fetchCategories
{
    [self.communicator getCategories];
}

-(void)fetchGoals
{
    [self.communicator getGoals];
}

#pragma HabitAPI Delegate Methods


// A generic method for handling habit data coming from the API
// it should redirect to correct parser based on the given object type
- (void)receiveJsonData:(NSArray *)parsedData
{
    [self.delegate didReceiveData:parsedData];
}

- (void)fetchingDataFailedWithError:(NSError *)error
{
    [self.delegate fetchingDataFailedWithError:error];
}

@end
