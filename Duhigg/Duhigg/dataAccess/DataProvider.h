//
//  DataProvider.h
//  Duhigg
//
//  Created by Yigit Can Arin on 11/20/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HabittAPI.h"

@protocol DataProviderDelegate // Make a more generic name and structure
- (void)didReceiveData:(NSArray *)parsedData;
- (void)fetchingDataFailedWithError:(NSError *)error;
@end

@interface DataProvider : NSObject<HabittAPIDelegate>

@property (strong, nonatomic) HabittAPI *communicator;
@property (weak, nonatomic) id<DataProviderDelegate> delegate;

- (void)fetchSubscriptions;
- (void)fetchCategories;
- (void)fetchGoals;

@end
