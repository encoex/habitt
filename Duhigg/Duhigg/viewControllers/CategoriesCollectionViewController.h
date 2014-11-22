//
//  CategoriesCollectionViewController.h
//  Duhigg
//
//  Created by Yigit Can Arin on 11/18/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "DataProvider.h"

@interface CategoriesCollectionViewController : BaseViewController <UICollectionViewDelegate, UICollectionViewDataSource, DataProviderDelegate>

@property (strong, nonatomic)UICollectionView *collectionView;

@property (strong, nonatomic)NSArray *categories;
@property (strong, nonatomic)DataProvider *dataProvider;

@end
