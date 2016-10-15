//
//  CommentsViewCell.m
//  Goggles
//
//  Created by Abdi on 10/5/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "CommentsViewCell.h"

@implementation CommentsViewCell{
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];



    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView *avatar = [[UIImageView alloc] init];
        
        UILabel *name = [[UILabel alloc] init];
        
        UILabel *comment = [[UILabel alloc] init];
        
        comment.numberOfLines = 0;


        
        name.font = [UIFont fontWithName:@"AvenirNext-Medium" size:14];
        comment.font = [UIFont fontWithName:@"AvenirNext-Regular" size:14];

        
        name.text = @"Abdi";
        comment.text = @"Amazing story! Thanks for sharing. Was wondering how you were able to travel to so many counteries. How did you find the money for it? Amazing story! Thanks for sharing. Was wondering how you were able to travel to so many counteries. How did you find the money for it?";


        
        [avatar setTranslatesAutoresizingMaskIntoConstraints:NO];
        [name setTranslatesAutoresizingMaskIntoConstraints:NO];
        [comment setTranslatesAutoresizingMaskIntoConstraints:NO];


        avatar.image = [UIImage imageNamed:@"selfie.png"];
        
        avatar.clipsToBounds = YES;


        
//        [self.contentView addSubview:avatar];
        [self.contentView addSubview:name];
        [self.contentView addSubview:comment];


        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(10)-[label]-(10)-|" options:0 metrics:nil views:@{@"label":comment}]];  // horizontal constraint
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(10)-[name]-(10)-[label]-(10)-|" options:0 metrics:nil views:@{@"name":name, @"label":comment}]];

        
      //
//        //leading
//        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:avatar attribute:NSLayoutAttributeLeading relatedBy:
//                                   NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:10.0f]];
        
//        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:name attribute:NSLayoutAttributeLeading relatedBy:
//                                         NSLayoutRelationEqual toItem:avatar attribute:NSLayoutAttributeLeading multiplier:1.0f constant:60]];
        
//        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:comment attribute:NSLayoutAttributeLeft relatedBy:
//                                         NSLayoutRelationEqual toItem:avatar attribute:NSLayoutAttributeRight multiplier:1.0f constant:10]];
//        
        //trailing
//        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:comment attribute:NSLayoutAttributeTrailing relatedBy:
//                                         NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-5.0f]];
//
        
        //bottom
//        
//        [self.contentView  addConstraint:[NSLayoutConstraint constraintWithItem:comment attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0]];
        
        
        //top constraint
//        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:avatar attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0f constant:10.0f]];
        
//          [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:name attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0f constant:10.0f]];
//             [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:comment attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:name attribute:NSLayoutAttributeTop multiplier:1.0f constant:15.0f]];
        
//          [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:name attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0f constant:10.0f]];
        
//               [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:comment attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:name attribute:NSLayoutAttributeTop multiplier:1.0f constant:13]];
        
        
        //avator width
//        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:avatar attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:50.0f]];
        
        
//        [comment addConstraint:[NSLayoutConstraint constraintWithItem:comment
//                                                          attribute:NSLayoutAttributeWidth
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:nil
//                                                          attribute: NSLayoutAttributeWidth
//                                                         multiplier:1
//                                                           constant:300]];
        
//        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:name attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:100]];
        
//          [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:comment attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:200]];
        
        
        //avator height

//        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:avatar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:50.0f]];
        
        avatar.layer.cornerRadius = 25;

        

        [self layoutSubviews];
    }
    return self;
}
- (void)layoutSubViews
{
    [super layoutSubviews];
    
    
   
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
