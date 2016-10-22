//
//  HostView.m
//  Goggles
//
//  Created by Abdi on 10/21/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "HostView.h"

@implementation HostView{
    CAGradientLayer *gradient;
    UIButton *play ;
}

-(id) init{
    
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}



-(id) initWithFrame:(CGRect)frame  attachToView:(UIView *)view{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.translatesAutoresizingMaskIntoConstraints = NO;

        
        self.backgroundColor = [UIColor whiteColor];
        [view addSubview:self];
        
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 15;
        
        _img = [[UIImageView alloc]init];
        
//        _img.clipsToBounds = YES;
//        _img.layer.cornerRadius = 15;
        

        
        
       UIImageView* play_img = [[UIImageView alloc]init];
        
        
        
        play_img.image = [UIImage imageNamed:@"play-tri.png"];
        

        
        _img.translatesAutoresizingMaskIntoConstraints = NO;
        
        
_name = [[UILabel alloc]init];
        
        _name.translatesAutoresizingMaskIntoConstraints = NO;
        
        _name.font = [UIFont fontWithName:@"AvenirNext-Medium" size:22];
        
        _company = [[UILabel alloc]init];
        
        _company.translatesAutoresizingMaskIntoConstraints = NO;
        
        _company.font = [UIFont fontWithName:@"AvenirNext-Regular" size:13];
        _company.textColor = [UIColor lightGrayColor];
        
        
        _bio = [[UILabel alloc]init];
        
        _bio.translatesAutoresizingMaskIntoConstraints = NO;
        
       
        _bio.font = [UIFont fontWithName:@"AvenirNext-Regular" size:13];
        _bio.textColor = [UIColor darkGrayColor];
        _bio.numberOfLines = 0;
        
        
        play = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [play addTarget:self
//                 action:@selector(playStory)
//         forControlEvents:UIControlEventTouchUpInside];
        
        play.backgroundColor = [UIColor clearColor];
        
        play.layer.borderWidth=1.0f;
        play.layer.borderColor=[[UIColor whiteColor] CGColor];
        

        
        play.translatesAutoresizingMaskIntoConstraints = NO;
        play_img.translatesAutoresizingMaskIntoConstraints = NO;


        
        
        
      




      
        
        
        
        
        [self addSubview:_img];
        [self addSubview:_name];
        [self addSubview:_company];
        [self addSubview:_bio];
        
        [_img addSubview:play];
        
        [play addSubview:play_img];



        
        


        
        
        
        //Main view
        [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:5.0f]];
        
        [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-5.0f]];
        
        [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1.0f constant:70.0f]];
        
        [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-5.0f]];
        
        
        
        //image
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_img attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_img attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_img attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
        
        [_img addConstraint:[NSLayoutConstraint constraintWithItem:_img
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute: NSLayoutAttributeNotAnAttribute
                                                            multiplier:1
                                                              constant:self.frame.size.height/2]];
        
        
        //name label
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_name attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0f constant:20]];
        
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_name attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_img attribute:NSLayoutAttributeBottom multiplier:1.0f constant:10]];
        
        
        //subname label
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_company attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0f constant:20]];
        
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_company attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_name attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0]];
        
        
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_bio attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_company attribute:NSLayoutAttributeBottom multiplier:1.0f constant:3]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_bio attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0f constant:20.0f]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_bio attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-5.0f]];
        
        
        
        //subname label
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_company attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0f constant:20]];
        
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_company attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_name attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0]];
        

        [play addConstraint:[NSLayoutConstraint constraintWithItem:play attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:100]];
        [play addConstraint:[NSLayoutConstraint constraintWithItem:play attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:100]];
        
        [_img addConstraint:[NSLayoutConstraint constraintWithItem:play attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_img attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
        [_img addConstraint:[NSLayoutConstraint constraintWithItem:play attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_img attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        
        
        [play_img addConstraint:[NSLayoutConstraint constraintWithItem:play_img attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:50]];
        [play_img addConstraint:[NSLayoutConstraint constraintWithItem:play_img attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:50]];
        
        [play addConstraint:[NSLayoutConstraint constraintWithItem:play_img attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:play attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
        [play addConstraint:[NSLayoutConstraint constraintWithItem:play_img attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:play attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        


        

        
        

        
//        [self addConstraint:[NSLayoutConstraint constraintWithItem:img attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-5.0f]];
        

    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    play.clipsToBounds = YES;
    play.layer.cornerRadius = 50;
    
    gradient = [CAGradientLayer layer];
    gradient.frame = _img.frame;
    
    // Add colors to layer
    UIColor *centerColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.45];
    UIColor *endColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.45];
    UIColor *endColor2 = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.45];
    
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[endColor2 CGColor],
                       (id)[centerColor CGColor],
                       (id)[endColor CGColor],
                       nil];
    
    [_img.layer insertSublayer:gradient atIndex:0];

    
    
}






@end
