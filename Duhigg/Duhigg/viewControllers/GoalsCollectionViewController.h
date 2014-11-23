//
//  GoalsCollectionViewController.h
//  Duhigg
//
//  Created by Yigit Can Arin on 11/23/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import "BaseViewController.h"
#import "DataProvider.h"

@interface GoalsCollectionViewController : BaseViewController <UICollectionViewDelegate, UICollectionViewDataSource, DataProviderDelegate>

@property (strong, nonatomic)UICollectionView *collectionView;

@property (strong, nonatomic)NSArray *goals;
@property (strong, nonatomic)DataProvider *dataProvider;

@end
