//
//  SubscribedItemsViewController.m
//  Duhigg
//
//  Created by Yigit Can Arin on 11/10/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import "CategoriesCollectionViewController.h"
#import "SubscribedItemsViewController.h"
#import "SubscriptionTableViewCell.h"
#import "HabitsCollectionViewController.h"

@interface SubscribedItemsViewController ()

@property NSArray *tableData;
@property NSArray *sectionTitles;

@end

@implementation SubscribedItemsViewController

- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,
                                                                  0,
                                                                  self.view.frame.size.width + 15,
                                                                  self.view.frame.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 80;
        
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
    return _tableView;
}

- (UITableViewCell *)objectInTableViewAtIndex:(NSUInteger)index
{
    UITableViewCell *tableCell = [UITableViewCell new];
    
    return tableCell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    SubscriptionTableViewCell *cell = (SubscriptionTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"SubscriptionTableViewCell"];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SubscriptionTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.title.text = [self.tableData objectAtIndex:indexPath.row];
    [cell.thumbnail setImage:[UIImage imageNamed:@"ThumbNail"]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.tableData.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sectionTitles[section];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(goToSelections)];
    
    self.navigationItem.title = @"My Habits";
    
    self.sectionTitles = [NSArray arrayWithObjects:@"To Do", @"Done", nil];
    
    self.tableData = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", nil];
    
//    self.tableData = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
    [self.view addSubview:self.tableView];
    
}

- (void)goToSelections
{
    CategoriesCollectionViewController *categoriesController = [[CategoriesCollectionViewController alloc]init];
    [self.navigationController pushViewController:categoriesController animated:YES];
    
    //HabitsCollectionViewController *habitViewController = [[HabitsCollectionViewController alloc]init];
    //[self.navigationController pushViewController:habitViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
