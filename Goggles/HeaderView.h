//
//  HeaderView.h
//  Goggles
//
//  Created by Abdi on 10/16/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UIView

@property (nonatomic, assign) BOOL commentsDrawer;
@property (nonatomic, strong) NSLayoutConstraint *headerViewTopLayout;

@property (nonatomic, strong) UIImageView *cancel;
@property (nonatomic, strong) UIView *subHead;

@property (nonatomic, strong) UILabel *commentsLabel;



-(id) initWithFrame:(CGRect)frame  attachToView:(UIView *)view;

@end
