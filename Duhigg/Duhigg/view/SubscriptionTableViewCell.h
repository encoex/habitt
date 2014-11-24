//
//  SubscriptionTableViewCell.h
//  Duhigg
//
//  Created by Yigit Can Arin on 11/14/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SWTableViewCell.h>

@interface SubscriptionTableViewCell : SWTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;
@property (strong, nonatomic) IBOutlet UIView *compIcon;

@property bool isCompleted;

- (void)setUpView;

- (void)toggleCompleted;
- (void)doPopAnimation;

@end
