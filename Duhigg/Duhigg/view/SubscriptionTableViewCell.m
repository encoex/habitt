//
//  SubscriptionTableViewCell.m
//  Duhigg
//
//  Created by Yigit Can Arin on 11/14/14.
//  Copyright (c) 2014 Yigit Can Arin. All rights reserved.
//

#import "SubscriptionTableViewCell.h"
#import <POP/POP.h>

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
    self.compIcon.backgroundColor = [UIColor blueColor];
    [self.compIcon setFrame:CGRectMake(self.compIcon.frame.origin.x,
                                       self.compIcon.frame.origin.y,
                                       60,60)];
    
    //self.completeIcon.alpha = 1;
    self.compIcon.layer.cornerRadius = 30;
}

- (void)toggleCompleted
{
    if (self.isCompleted)
    {
        self.isCompleted = NO;
    }
    else
    {
        self.isCompleted = YES;
    }
}


- (void)doPopAnimation
{
    POPSpringAnimation *springAnimation = [POPSpringAnimation animation];
    springAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
    
    CGRect currentFrame = self.compIcon.frame;
    
    
    springAnimation.springBounciness = 15;    // value between 0-20 default at 4
    springAnimation.springSpeed = 5;     // value between 0-20 default at 4
    
    springAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(self.frame.size.width / 2, 10, 80, 80)];
    
    springAnimation.name = @"AnyAnimationNameYouWant";
    springAnimation.delegate = self;
    
    [self.compIcon pop_addAnimation:springAnimation forKey:@"WhatEverNameYouWant"];
    self.compIcon.layer.cornerRadius = 40;
}

@end
