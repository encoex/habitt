//
//  HabitSubscription.h
//  Duhigg
//
//  Created by Yigit Can Arin on 11/24/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HabitSubscription : NSObject

@property (strong, nonatomic)NSNumber *check_in_count;
@property bool *checked_in_today;
@property (strong, nonatomic)NSString *create_date;
@property (strong, nonatomic)NSNumber *goal_id;
@property (strong, nonatomic)NSNumber *ID;
@property (strong, nonatomic)NSString *title;
@property (strong, nonatomic)NSNumber *user_id;

@end
