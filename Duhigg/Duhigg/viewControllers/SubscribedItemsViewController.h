//
//  SubscribedItemsViewController.h
//  Duhigg
//
//  Created by Yigit Can Arin on 11/10/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import "BaseViewController.h"
#import <SWTableViewCell.h>

@interface SubscribedItemsViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource, SWTableViewCellDelegate, DataProviderDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic)DataProvider *dataProvider;

@end
