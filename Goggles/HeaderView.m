//
//  HeaderView.m
//  Goggles
//
//  Created by Abdi on 10/16/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

-(id) init{
    
    self = [super init];

    if (self) {
        
    }
    
    return self;
}



-(id) initWithFrame:(CGRect)frame  attachToView:(UIView *)view{
    
    self = [super initWithFrame:frame];
    if (self) {

        
        
        
        
        self.backgroundColor = [UIColor clearColor];
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        [view addSubview:self];
        
        
        
        UIImageView *chat = [[UIImageView alloc]init];
        
        
        _subHead = [[UIView alloc]init];
        
        

        chat.image = [UIImage imageNamed:@"arrow-up@3x.png"];
        
        
        
        chat.translatesAutoresizingMaskIntoConstraints = NO;
        _subHead.translatesAutoresizingMaskIntoConstraints = NO;

        
        
        _cancel = [[UIImageView alloc]init];
        _cancel.alpha=0;
        
        _cancel.image = [UIImage imageNamed:@"cancel-filled@3x.png"];
        
        
        
        chat.translatesAutoresizingMaskIntoConstraints = NO;
        _cancel.translatesAutoresizingMaskIntoConstraints = NO;
        
        
        
        
        
        
        
        
        _commentsLabel = [UILabel new];
        _commentsLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _commentsLabel.text = @"Q & A";
        _commentsLabel.font = [UIFont fontWithName:@"AvenirNext-Medium" size:15];
        _commentsLabel.textColor = [UIColor whiteColor];
        
        
        _commentsLabel.textAlignment = NSTextAlignmentCenter;
        
        [_subHead addSubview:_commentsLabel];
        [_subHead addSubview:chat];
        
        [_subHead addSubview:_cancel];
        
        [self addSubview:_subHead];
        
        
        
        [_subHead addConstraint:[NSLayoutConstraint constraintWithItem:_commentsLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_subHead attribute:NSLayoutAttributeTop multiplier:1.0f constant:18]];
        
        [_subHead addConstraint:[NSLayoutConstraint constraintWithItem:_commentsLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_subHead attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        
        [_subHead addConstraint:[NSLayoutConstraint constraintWithItem:chat attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_subHead attribute:NSLayoutAttributeTop multiplier:1.0f constant:-5]];
        
        [_subHead addConstraint:[NSLayoutConstraint constraintWithItem:chat attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_subHead attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        
        
        
        [_subHead addConstraint:[NSLayoutConstraint constraintWithItem:_cancel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_subHead attribute:NSLayoutAttributeTop multiplier:1.0f constant:15]];
        
        [_subHead addConstraint:[NSLayoutConstraint constraintWithItem:_cancel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_subHead attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-10.0f]];
        
        
        
        
        [_cancel addConstraint:[NSLayoutConstraint constraintWithItem:_cancel
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:nil
                                                           attribute: NSLayoutAttributeNotAnAttribute
                                                          multiplier:1
                                                            constant:20]];
        
        [_cancel addConstraint:[NSLayoutConstraint constraintWithItem:_cancel
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:nil
                                                           attribute: NSLayoutAttributeNotAnAttribute
                                                          multiplier:1
                                                            constant:20]];
        
        
        
        
        
         [self addConstraint:[NSLayoutConstraint constraintWithItem:_subHead attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_subHead attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_subHead attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
        
        [_subHead addConstraint:[NSLayoutConstraint constraintWithItem:_subHead
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute: NSLayoutAttributeNotAnAttribute
                                                           multiplier:1
                                                             constant:50]];
        
   
        
        
        
        
        _headerViewTopLayout = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1.0f constant:frame.size.height-50];
        
        
        
        
        
        [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
        
        [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
        
        [view addConstraint:_headerViewTopLayout];
        
        [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];
        

        
        
        
        
    }
    return self;
    
}







@end
