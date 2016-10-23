//
//  CollectionViewCell.m
//  Goggles
//
//  Created by Abdi on 10/22/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithFrame:(CGRect)aRect{
    self = [super initWithFrame:aRect];
    if (self) {
        
        
        _icon = [[UIImageView alloc]init];
        _icon.translatesAutoresizingMaskIntoConstraints = NO;
        
        _handle = [[UILabel alloc]init];
        _handle.translatesAutoresizingMaskIntoConstraints = NO;
        
        _handle.font = [UIFont fontWithName:@"AvenirNext-Regular" size:7];
        
        [self.contentView addSubview:_icon];



        
        
          [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_icon attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        
           [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_icon attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
        
        [_icon addConstraint:[NSLayoutConstraint constraintWithItem:_icon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:30]];

        
        [_icon addConstraint:[NSLayoutConstraint constraintWithItem:_icon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:30]];
        
        
        
        
    }
    return self;
    
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
}


@end
