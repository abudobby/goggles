//
//  Que.m
//  Squoria
//
//  Created by Musse, Abdi on 6/24/16.
//  Copyright © 2016 Squoria, Inc. All rights reserved.
//

#import "Player.h"

@implementation Player

+(Player *) thePlayer{
    
    
Player *thePlayer = nil;
    
    if (!thePlayer) {
        thePlayer = [[super allocWithZone:nil] init];
    }
    
    return  thePlayer;
    
}

+(id)allocWithZone:(struct _NSZone *)zone{
    
    return [self thePlayer];
}




-(id) init{
    
    
    self = [super init];
    if (self) {
        _queuePlayer = [AVQueuePlayer queuePlayerWithItems:@[]];
        

    }
    
    return self;
}



-(void)setItems:(NSMutableArray*)items{
    
    
    [_queuePlayer insertItem:[items objectAtIndex:0] afterItem:_queuePlayer.currentItem];


    for (int i=0; i<items.count-1; i++) {
        
        
        
        [[items objectAtIndex:i] seekToTime:kCMTimeZero];

        [_queuePlayer insertItem:[items objectAtIndex:i+1] afterItem:[_queuePlayer.items objectAtIndex:i]];
        


    }
    
    
    


    
}
- (void)play {
    
    [ _queuePlayer.currentItem seekToTime:kCMTimeZero];

    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive:true error:nil];
    
    [_queuePlayer play];
}
- (void)remove {

    [_queuePlayer removeAllItems];
}
@end
