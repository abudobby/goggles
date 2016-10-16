//
//  VideoView.m
//  Goggles
//
//  Created by Abdi on 10/16/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "VideoView.h"
#import "Player.h"

@implementation VideoView{
    Player *player;
    AVPlayerViewController *playerController;

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
        
        self.backgroundColor = [UIColor blackColor];
        [view addSubview:self];
        
        
        
        
        [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
        
        [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
        
        [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f]];
        
        [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];
        
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"150250" withExtension:@"mp4"];
        
        
        
        
        AVURLAsset *asset = [AVURLAsset assetWithURL: url];
        
        NSMutableArray *vids = [[NSMutableArray alloc] init];
        
        AVPlayerItem *item = [AVPlayerItem playerItemWithAsset: asset];
        
        [vids addObject:item];
        
        player = [Player thePlayer];
        
        [player setItems:vids];

    
        
        AVPlayerLayer *layer = (AVPlayerLayer *)self.layer;
        layer.player = player.queuePlayer;

        player.queuePlayer.muted = YES;
        
        
        layer.player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(playerItemDidReachEnd:)
                                                     name:AVPlayerItemDidPlayToEndTimeNotification
                                                   object:[layer.player currentItem]];
        
        [player play];
        

        
    }
    return self;
}
- (void)playerItemDidReachEnd:(NSNotification *)notification {
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero];
}



@end
