//
//  CustomCell.m
//  Goggles
//
//  Created by Abdi on 10/17/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "CustomCell.h"
#import "Question.h"

@implementation CustomCell{
   
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        avater = [[UIImageView alloc]init];
        user = [[UILabel alloc]init];
        questionLabel = [[UILabel alloc]init];
        
        
        user.font = [UIFont fontWithName:@"AvenirNext-Medium" size:15];
        questionLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:15];
        questionLabel.numberOfLines = 0;
        
        
        avater.translatesAutoresizingMaskIntoConstraints = NO;
        user.translatesAutoresizingMaskIntoConstraints = NO;
        questionLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        
        [self addSubview:avater];
        [self addSubview:user];
        [self addSubview:questionLabel];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:avater attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:5]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:avater attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0f constant:5.0f]];
        
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:user attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:5]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:user attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:avater attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:5.0f]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:questionLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:user attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:questionLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:avater attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:5]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:questionLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:questionLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-30.0f]];
        
        
        
        
        
        [avater addConstraint:[NSLayoutConstraint constraintWithItem:avater
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:nil
                                                           attribute: NSLayoutAttributeNotAnAttribute
                                                          multiplier:1
                                                            constant:42]];
        
        [avater addConstraint:[NSLayoutConstraint constraintWithItem:avater
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:nil
                                                           attribute: NSLayoutAttributeNotAnAttribute
                                                          multiplier:1
                                                            constant:42]];
        


        
        
        
        

        
        
        
        
    }
    
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    avater.clipsToBounds = YES;
    avater.layer.cornerRadius = avater.frame.size.width/2;
    
}

- (void)setModel:(Question *)model {
    user.text = model.title;
    questionLabel.text = model.content;
    avater.image = [UIImage imageNamed:model.avatar];
    
    
}

- (void)setUI{
    avater = [[UIImageView alloc]init];
    user = [[UILabel alloc]init];
    questionLabel = [[UILabel alloc]init];
    
    
    user.font = [UIFont fontWithName:@"AvenirNext-Medium" size:15];
    questionLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:15];
    questionLabel.numberOfLines = 0;
    
    
    avater.translatesAutoresizingMaskIntoConstraints = NO;
    user.translatesAutoresizingMaskIntoConstraints = NO;
    questionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    [self addSubview:avater];
    [self addSubview:user];
    [self addSubview:questionLabel];

    
    
}






#pragma Constraints

-(void)setConstraints{
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:avater attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:5]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:avater attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0f constant:5.0f]];
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:user attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:5]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:user attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:avater attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:5.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:questionLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:user attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:questionLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:avater attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:5]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:questionLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:questionLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-30.0f]];
    
    
    
    
    
    [avater addConstraint:[NSLayoutConstraint constraintWithItem:avater
                                                       attribute:NSLayoutAttributeHeight
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:nil
                                                       attribute: NSLayoutAttributeNotAnAttribute
                                                      multiplier:1
                                                        constant:42]];
    
    [avater addConstraint:[NSLayoutConstraint constraintWithItem:avater
                                                       attribute:NSLayoutAttributeWidth
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:nil
                                                       attribute: NSLayoutAttributeNotAnAttribute
                                                      multiplier:1
                                                        constant:42]];
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
