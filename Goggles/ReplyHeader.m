//
//  ReplyHeader.m
//  Goggles
//
//  Created by Abdi on 10/17/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "ReplyHeader.h"

@implementation ReplyHeader{
    UIImageView *avater;
    UILabel *questionLabel;
}

-(id)initWithFrame:(CGRect)frame question: (Question *)question{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
    
        self.backgroundColor = [UIColor whiteColor];
        
        UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:frame];
        self.layer.masksToBounds = NO;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
        self.layer.shadowOpacity = 0.1f;
        self.layer.shadowPath = shadowPath.CGPath;
        
        [self setContenets:question];
        
    }
    
    return self;
}

-(void)setContenets:(Question *)question {
    
    avater = [[UIImageView alloc]init];
    UILabel *user = [[UILabel alloc]init];
    questionLabel = [[UILabel alloc]init];

    
    user.text = question.title;
    user.font = [UIFont fontWithName:@"AvenirNext-Medium" size:17];
    
    questionLabel.text = question.content;
    questionLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:17];
    questionLabel.numberOfLines = 0;

    
    avater.image = [UIImage imageNamed:question.avatar];
    
    
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
    
    
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:questionLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:user attribute:NSLayoutAttributeBottom multiplier:1.0f constant:3]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:questionLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:avater attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:5.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:questionLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-5.0f]];

    
    

    
    
    
    [avater addConstraint:[NSLayoutConstraint constraintWithItem:avater
                                                        attribute:NSLayoutAttributeWidth
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:nil
                                                        attribute: NSLayoutAttributeNotAnAttribute
                                                       multiplier:1
                                                         constant:50]];
    
    [avater addConstraint:[NSLayoutConstraint constraintWithItem:avater
                                                        attribute:NSLayoutAttributeHeight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:nil
                                                        attribute: NSLayoutAttributeNotAnAttribute
                                                       multiplier:1
                                                         constant:50]];
    
    

    
    
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];

    avater.clipsToBounds = YES;
    avater.layer.cornerRadius = avater.frame.size.width/2;

}




@end
