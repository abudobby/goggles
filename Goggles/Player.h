//
//  Que.h
//  Squoria
//
//  Created by Musse, Abdi on 6/24/16.
//  Copyright © 2016 Squoria, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface Player : NSObject

@property (nonatomic, strong) NSMutableArray *playerItem;
@property (nonatomic, strong, readonly) AVQueuePlayer   *queuePlayer;

-(void)setItems:(NSMutableArray*)items;
- (void)play;
- (void)remove;


+(Player *) thePlayer;


@end
