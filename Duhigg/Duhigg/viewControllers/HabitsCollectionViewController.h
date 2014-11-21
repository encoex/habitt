//
//  HabitsCollectionViewController.h
//  Duhigg
//
//  Created by Yigit Can Arin on 11/16/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface HabitsCollectionViewController : BaseViewController <UICollectionViewDataSource, UICollectionViewDelegate>


@property (strong, nonatomic)UICollectionView *collectionView;

@end
