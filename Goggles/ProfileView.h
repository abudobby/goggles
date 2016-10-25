//
//  HostView.h
//  Goggles
//
//  Created by Abdi on 10/21/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pulldown.h"

@interface ProfileView : UIView

@property (nonatomic, strong) UIImageView *img;

@property (nonatomic, strong) Pulldown *pulldown;

@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *company;
@property (nonatomic, strong) UILabel *bio;
@property (nonatomic, strong) NSLayoutConstraint *heightP;

@property (nonatomic, strong) UIButton *play;
;




@property (nonatomic, strong) UICollectionView *collectV;





-(id) initWithFrame:(CGRect)frame  attachToView:(UIView *)view;

@end
