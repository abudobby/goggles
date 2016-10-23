//
//  NextCollectionViewCell.m
//  Goggles
//
//  Created by Abdi on 10/22/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "NextCollectionViewCell.h"


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation NextCollectionViewCell


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
        
        _handle.font = [UIFont fontWithName:@"AvenirNext-Regular" size:12];
        _handle.text = @"Tomorrow";
        
        
        _company = [[UILabel alloc]init];
        _company.translatesAutoresizingMaskIntoConstraints = NO;
        
        _company.font = [UIFont fontWithName:@"AvenirNext-Regular" size:8];
        _company.textColor = [UIColor darkGrayColor];
        _company.text = @"UX Designer at PayPal";
        



        
        
        _name = [[UILabel alloc]init];
        _name.translatesAutoresizingMaskIntoConstraints = NO;
        
        _name.font = [UIFont fontWithName:@"AvenirNext-Medium" size:12];
        _name.textColor = UIColorFromRGB(0x3498db);

        
        
        
        [self.contentView addSubview:_icon];
        [self.contentView addSubview:_handle];
        [self.contentView addSubview:_name];
        [self.contentView addSubview:_company];



        
        
        
        
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_icon attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_handle attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];

        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_handle attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:5]];
        
        
        
             [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_icon attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_handle attribute:NSLayoutAttributeBottom multiplier:1 constant:5]];
        
        [_icon addConstraint:[NSLayoutConstraint constraintWithItem:_icon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:50]];
        
        
        [_icon addConstraint:[NSLayoutConstraint constraintWithItem:_icon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:50]];
        
        
             [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_name attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_name attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_icon attribute:NSLayoutAttributeBottom multiplier:1 constant:5]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_company attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_company attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_name attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
        


        
        
        
        
    }
    return self;
    
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
    _icon.clipsToBounds = YES;
    _icon.layer.cornerRadius = 25;
    
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 6;
    
}


@end
