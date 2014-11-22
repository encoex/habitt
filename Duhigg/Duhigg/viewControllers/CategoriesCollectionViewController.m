//
//  CategoriesCollectionViewController.m
//  Duhigg
//
//  Created by Yigit Can Arin on 11/18/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//


#import <SDWebImage/UIImageView+WebCache.h>
#import "CategoriesCollectionViewController.h"
#import "CategoriesCellView.h"
#import "HabitCategory.h"

#define COLLECTION_TOP_MARGIN 10
#define COLLECTION_SIDE_MARGIN 10
#define COLLECTION_BOTTOM_MARGIN 10

@interface CategoriesCollectionViewController ()

@end


@implementation CategoriesCollectionViewController

- (UICollectionView *)collectionView
{
    if(!_collectionView)
    {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(self.view.frame.size.width - COLLECTION_SIDE_MARGIN*2, 140);
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
        [flowLayout setSectionInset:UIEdgeInsetsMake(COLLECTION_TOP_MARGIN, COLLECTION_SIDE_MARGIN, COLLECTION_SIDE_MARGIN, COLLECTION_BOTTOM_MARGIN)];
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerNib:[UINib nibWithNibName:@"CategoriesCellView" bundle:nil]
          forCellWithReuseIdentifier:@"CategoriesCellView"];
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
    
    [self.dataProvider fetchCategories];
    
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.categories.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CategoriesCellView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CategoriesCellView" forIndexPath:indexPath];
    
    HabitCategory *currentCategory = self.categories[indexPath.item];
    
    [cell.categoryImage sd_setImageWithURL:[NSURL URLWithString:currentCategory.image]
                          placeholderImage:nil];
    
    cell.categoryTitle.text = currentCategory.title;
    
    return cell;
}

#pragma mark <CategoriesDelegate>

- (void)didReceiveData:(NSArray *)categories
{
    self.categories = categories;
    
    if(categories.count > 0)
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
