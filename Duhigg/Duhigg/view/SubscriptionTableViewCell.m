//
//  SubscriptionTableViewCell.m
//  Duhigg
//
//  Created by Yigit Can Arin on 11/14/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import "SubscriptionTableViewCell.h"
#import <POP/POP.h>

#import "HabittColor.h"

@interface SubscriptionTableViewCell ()

@property UIColor *cellRestoreColor;

@end

@implementation SubscriptionTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUpView
{
    [self.checkIcon setHidden:YES];
    
    self.compIcon.backgroundColor = [UIColor grayColor];
    self.compIcon.layer.cornerRadius = 5;
}

- (void)toggleCompleted
{
    if (self.isCompleted)
    {
        self.isCompleted = NO;
        [self doUncheckedPopAnimation];
        [self.checkIcon setHidden:YES];
    }
    else
    {
        self.isCompleted = YES;
        [self doCheckedPopAnimation];
        [self.checkIcon setHidden:NO];
    }
}

- (void)doCheckedPopAnimation
{
    POPSpringAnimation *springAnimation = [POPSpringAnimation animation];
    springAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];

    springAnimation.springBounciness = 20;    // value between 0-20 default at 4
    springAnimation.springSpeed = 13;     // value between 0-20 default at 4
    
    springAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(20, 20, 40, 40)];
    
    springAnimation.name = @"AnyAnimationNameYouWant";
    springAnimation.delegate = self;
    
    [self.compIcon pop_addAnimation:springAnimation forKey:@"WhatEverNameYouWant"];
    self.compIcon.layer.cornerRadius = 20;
    self.compIcon.backgroundColor = [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0];
    self.cellRestoreColor =  [self.contentView backgroundColor];
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
}

- (void)doUncheckedPopAnimation
{
    POPSpringAnimation *springAnimation = [POPSpringAnimation animation];
    springAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
    
    springAnimation.springBounciness = 15;    // value between 0-20 default at 4
    springAnimation.springSpeed = 15;     // value between 0-20 default at 4
    
    springAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(35, 35, 10, 10)];
    
    springAnimation.name = @"AnyAnimationNameYouWant";
    springAnimation.delegate = self;
    
    self.compIcon.layer.cornerRadius = 5;
    
    [self.compIcon pop_addAnimation:springAnimation forKey:@"WhatEverNameYouWant"];
    
    self.compIcon.backgroundColor = [UIColor grayColor];
    
    [self.contentView setBackgroundColor:self.cellRestoreColor];

}

@end
