//
//  SubscribedItemsViewController.m
//  Duhigg
//
//  Created by Yigit Can Arin on 11/10/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import "CategoriesCollectionViewController.h"
#import "GoalsCollectionViewController.h"
#import "SubscribedItemsViewController.h"
#import "SubscriptionTableViewCell.h"

#import "HabittColor.h"
#import "HabitSubscription.h"

@interface SubscribedItemsViewController ()

@property NSArray *subscriptions;
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
        [_tableView setBackgroundColor:UIColorFromRGB(0xDEDEDE)];
    }
    
    return _tableView;
}

- (UITableViewCell *)objectInTableViewAtIndex:(NSUInteger)index
{
    UITableViewCell *tableCell = [UITableViewCell new];
    
    return tableCell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSIndexPath *endIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    //[self.tableView moveRowAtIndexPath:indexPath toIndexPath:endIndexPath];
    
    return indexPath;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SubscriptionTableViewCell *cell = (SubscriptionTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"SubscriptionTableViewCell"];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SubscriptionTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.leftUtilityButtons = [self leftButtons];
    cell.rightUtilityButtons = [self rightButtons];
    cell.delegate = self;
    
    //HabitSubscription *currentSub = [self.subscriptions objectAtIndex:indexPath.row];
    //cell.title.text = currentSub.title;
    
    cell.title.text =  [self.subscriptions objectAtIndex:indexPath.row];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    [cell setUpView];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.subscriptions.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sectionTitles[section];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(goToSelections)];
    
    self.navigationItem.title = @"My Habits";
    self.subscriptions = [NSArray arrayWithObjects:@"Do this", @"Do that", @"And the other thing", @"And probably the other other thing", nil];
    
    self.dataProvider = [[DataProvider alloc] init];
    self.dataProvider.communicator = [[HabittAPI alloc] init];
    self.dataProvider.communicator.delegate = self.dataProvider;
    self.dataProvider.delegate = self;
    
    //[self.dataProvider fetchSubscriptions];
    
    [self.view addSubview:self.tableView];
    
}

- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                title:@"Edit"];
    return rightUtilityButtons;
}

- (NSArray *)leftButtons
{
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0]
                                                icon:[UIImage imageNamed:@"Check"]];
    return leftUtilityButtons;
}

- (void)goToSelections
{
    CategoriesCollectionViewController *categoriesController = [[CategoriesCollectionViewController alloc]init];
    [self.navigationController pushViewController:categoriesController animated:YES];
}

#pragma mark - SWTableViewDelegate START

- (void)swipeableTableViewCell:(SWTableViewCell *)cell scrollingToState:(SWCellState)state
{
    switch (state)
    {
        case 0:
        {
            NSLog(@"utility buttons closed");
        }
            break;
        case 1:
            NSLog(@"left utility buttons open");
            break;
//        case 2:
//            NSLog(@"right utility buttons open");
//            break;
        default:
            break;
    }
}


- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index
{
    SubscriptionTableViewCell *currentCell = (SubscriptionTableViewCell *)cell;
    [currentCell toggleCompleted];
    
    [cell hideUtilityButtonsAnimated:YES];
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index
{
    UIAlertView *alertTest = [[UIAlertView alloc] initWithTitle:@"Coming Soon!"
                                                        message:@"User will be able to edit or leave the goal"
                                                       delegate:nil
                                              cancelButtonTitle:@"Close"
                                              otherButtonTitles: nil];
    [alertTest show];
    
    [cell hideUtilityButtonsAnimated:YES];
}

- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell
{
    // allow just one cell's utility button to be open at once
    return YES;
}

- (BOOL)swipeableTableViewCell:(SWTableViewCell *)cell canSwipeToState:(SWCellState)state
{
    switch (state) {
        case 1:
            // set to NO to disable all left utility buttons appearing
            return YES;
            break;
        case 2:
            // set to NO to disable all right utility buttons appearing
            return NO;
            break;
        default:
            break;
    }
    
    return YES;
}

#pragma mark - SWTableViewDelegate END

#pragma mark - DataProviderDelegate START

- (void)didReceiveData:(NSArray *)data
{
    self.subscriptions = data;
    
    if(self.subscriptions.count > 0)
    {
        // this delegate method is not running in the main thread.
        // But the UI stuff should happen in the main thread, so we force.
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }
}

- (void)fetchingDataFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

#pragma mark - DataProviderDelegate END


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
