//
//  HostView.h
//  Goggles
//
//  Created by Abdi on 10/21/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HostView : UIView

@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *company;
@property (nonatomic, strong) UILabel *bio;





-(id) initWithFrame:(CGRect)frame  attachToView:(UIView *)view;

@end
