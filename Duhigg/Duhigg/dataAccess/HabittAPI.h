//
//  HabittAPI.h
//  Duhigg
//
//  Created by Yigit Can Arin on 11/20/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HabittAPIDelegate

- (void)receiveJsonData:(NSData *)objectNotation
                 object:(id)objectType;

- (void)fetchingDataFailedWithError:(NSError *)error;

@end

@interface HabittAPI : NSObject

@property (weak, nonatomic) id<HabittAPIDelegate> delegate;

- (void)getCategories;
- (void)getGoals;

@end
