//
//  VideoView.h
//  Goggles
//
//  Created by Abdi on 10/16/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoPlayer.h"

@interface VideoView : VideoPlayer
-(id) initWithFrame:(CGRect)frame  attachToView:(UIView *)view;

@end
