//
//  GoalsCollectionViewController.m
//  Duhigg
//
//  Created by Yigit Can Arin on 11/23/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>

#import "GoalsCollectionViewController.h"
#import "GoalsCollectionViewCell.h"
#import "HabitGoal.h"

#define COLLECTION_TOP_MARGIN 10
#define COLLECTION_SIDE_MARGIN 10
#define COLLECTION_BOTTOM_MARGIN 10


@implementation GoalsCollectionViewController


- (UICollectionView *)collectionView
{
    if(!_collectionView)
    {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - COLLECTION_SIDE_MARGIN*3)/2, 240);
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
        [flowLayout setSectionInset:UIEdgeInsetsMake(COLLECTION_TOP_MARGIN, COLLECTION_SIDE_MARGIN, COLLECTION_SIDE_MARGIN, COLLECTION_BOTTOM_MARGIN)];
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerNib:[UINib nibWithNibName:@"GoalsCollectionViewCell" bundle:nil]
          forCellWithReuseIdentifier:@"GoalsCollectionViewCell"];
    }
    
    return _collectionView;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataProvider = [[DataProvider alloc] init];
    self.dataProvider.communicator = [[HabittAPI alloc] init];
    self.dataProvider.communicator.delegate = self.dataProvider;
    self.dataProvider.delegate = self;
    
    [self.dataProvider fetchGoals];
    
    [self.view addSubview:self.collectionView];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.goals.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GoalsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoalsCollectionViewCell" forIndexPath:indexPath];
    
    HabitGoal *currentGoal = self.goals[indexPath.item];
    
    [cell.image sd_setImageWithURL:[NSURL URLWithString:currentGoal.image]
                          placeholderImage:nil];
    
    cell.title.text = currentGoal.title;

    return cell;
}

#pragma mark <CategoriesDelegate>

- (void)didReceiveData:(NSArray *)data
{
    self.goals = data;
    
    if(self.goals.count > 0)
    {
        // this delegate method is not running in the main thread.
        // But the UI stuff should happen in the main thread, so we force.
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    }
}

- (void)fetchingDataFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}


@end
