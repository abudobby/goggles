//
//  SettingsViewCell.m
//  Goggles
//
//  Created by Abdi on 10/24/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "SettingsViewCell.h"

@implementation SettingsViewCell
@synthesize listLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
      listLabel = [[UILabel alloc] init];
        
        listLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.contentView addSubview:listLabel];
        
        
        _edit = [UIButton buttonWithType:UIButtonTypeCustom];

        
        [_edit setTitle:@"Edit" forState:UIControlStateNormal];
        
        
                 
        _edit.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.contentView addSubview:_edit];
        
        _input = [[UITextField alloc] init];
        
        _input.translatesAutoresizingMaskIntoConstraints = NO;
        
        _input.textAlignment = NSTextAlignmentRight;
        _input.font = [UIFont fontWithName:@"AvenirNext-Regular" size:13];
        _input.textColor = [UIColor darkGrayColor];
        
        _input.clearButtonMode = UITextFieldViewModeWhileEditing;

        
        [self.contentView addSubview:_input];

        
        
        
        
      //label constraint
        
           [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:listLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
        
           [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:listLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView  attribute:NSLayoutAttributeLeading multiplier:1.0f constant:15]];
        
        
        //input constriants
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_input attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_input attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView  attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-10]];
        
        
        [_input addConstraint:[NSLayoutConstraint constraintWithItem:_input
                                                            attribute:NSLayoutAttributeWidth
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute: NSLayoutAttributeNotAnAttribute
                                                           multiplier:1
                                                             constant:self.contentView.frame.size.width/1.5]];
        
        
        
        //edit button
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_edit attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_edit attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView  attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-10]];

        
        
    }
    return self;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
}


@end
