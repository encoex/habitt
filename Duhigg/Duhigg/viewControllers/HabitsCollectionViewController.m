    //
//  HabitsCollectionViewController.m
//  Duhigg
//
//  Created by Yigit Can Arin on 11/16/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import "HabitsCollectionViewController.h"
#import "HabitSubCell.h"

#define COLLECTION_TOP_MARGIN 10
#define COLLECTION_SIDE_MARGIN 10
#define COLLECTION_BOTTOM_MARGIN 10

@interface HabitsCollectionViewController ()

@end

@implementation HabitsCollectionViewController

- (UICollectionView *)collectionView
{
    if(!_collectionView)
    {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - COLLECTION_SIDE_MARGIN*2 - 10)/2, 240);
        flowLayout.minimumLineSpacing = 10;
         flowLayout.minimumInteritemSpacing = 10;
        [flowLayout setSectionInset:UIEdgeInsetsMake(COLLECTION_TOP_MARGIN, COLLECTION_SIDE_MARGIN, COLLECTION_SIDE_MARGIN, COLLECTION_BOTTOM_MARGIN)];
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerNib:[UINib nibWithNibName:@"HabitSubCell" bundle:nil]
          forCellWithReuseIdentifier:@"HabitSubCell"];
    }
    
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    [self.view addSubview:self.collectionView];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HabitSubCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HabitSubCell" forIndexPath:indexPath];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
