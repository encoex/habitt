//
//  DataProvider.h
//  Duhigg
//
//  Created by Yigit Can Arin on 11/20/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HabittAPI.h"

@protocol CategoriesDelegate // Make a more generic name and structure
- (void)didReceiveCategories:(NSArray *)categories;
- (void)fetchingCategoriesFailedWithError:(NSError *)error;
@end

@interface DataProvider : NSObject<HabittAPIDelegate>

@property (strong, nonatomic) HabittAPI *communicator;
@property (weak, nonatomic) id<CategoriesDelegate> delegate;

- (void)fetchCategories;

@end
