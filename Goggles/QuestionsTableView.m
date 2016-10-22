//
//  Comments.m
//  Goggles
//
//  Created by Abdi on 10/8/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "QuestionsTableView.h"
#import "Question.h"

@implementation QuestionsTableView

static NSString *identifier = @"indentifier";

-(id) initWithFrame:(CGRect)frame style:(UITableViewStyle)style videoView:(UIView *)videoView
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.estimatedRowHeight = 80;
        self.rowHeight = UITableViewAutomaticDimension;
        self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.backgroundColor = [UIColor whiteColor];
        self.separatorColor = [UIColor groupTableViewBackgroundColor];
        
        
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        [videoView addSubview:self];
        [videoView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:
                                  NSLayoutRelationEqual toItem:videoView attribute:NSLayoutAttributeTop multiplier:1.0f constant:videoView.frame.origin.y+50]];
        [videoView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:
                                   NSLayoutRelationEqual toItem:videoView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
        
        [videoView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:videoView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
        
        
        [videoView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:frame.size.height/2]];
        
        
    }
    return self;
}


-(id) initWithReplies:(CGRect)frame style:(UITableViewStyle)style videoView:(UIView *)videoView
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.estimatedRowHeight = 80;
        self.rowHeight = UITableViewAutomaticDimension;
        self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.backgroundColor = [UIColor whiteColor];
        self.separatorColor = [UIColor groupTableViewBackgroundColor];
        
        
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        [videoView addSubview:self];
        [videoView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:
                                  NSLayoutRelationEqual toItem:videoView attribute:NSLayoutAttributeTop multiplier:1.0f constant:videoView.frame.origin.y]];
        [videoView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:
                                  NSLayoutRelationEqual toItem:videoView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
        
        [videoView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:videoView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
        
       _bottom = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:frame.size.height-50];
        
        
        [videoView addConstraint:_bottom];
        
        
    }
    return self;
}







@end
