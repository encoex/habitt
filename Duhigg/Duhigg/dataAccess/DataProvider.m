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
- (void)receiveJsonData:(NSData *)objectNotation
                 object:(id)objectType
{
    
    // Check object type and call appropriate json paresr
    
    
    NSError *error = nil;
    NSArray *dataArray = nil;
    
    if ([objectType isMemberOfClass:([HabitCategory class])])
    {
        dataArray = [JSONparser categoriesFromJson:objectNotation error:&error];
    }
    
    if (error != nil)
    {
        [self.delegate fetchingDataFailedWithError:error];
    }
    
    else
    {
        [self.delegate didReceiveData:dataArray];
    }

}

- (void)fetchingDataFailedWithError:(NSError *)error
{
    [self.delegate fetchingDataFailedWithError:error];
}

@end
