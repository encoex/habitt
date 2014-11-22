//
//  HabitGoal.h
//  Duhigg
//
//  Created by Yigit Can Arin on 11/22/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HabitGoal : NSObject

@property (strong, nonatomic) NSNumber *categoryId;
@property (strong, nonatomic) NSNumber *ID;
@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSString *summary;
@property (strong, nonatomic) NSString *title;

@end