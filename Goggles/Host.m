//
//  Host.m
//  Goggles
//
//  Created by Abdi on 10/23/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "Host.h"

@implementation Host



+ (instancetype)initWithDetails:(NSString *)img name:(NSString *)name job:(NSString *)job bio:(NSString *)bio social_media:(NSMutableArray *)social_media{
    
    return [[self alloc] initHost:img name:name job:job bio:bio social_media:social_media];
}

-initHost:(NSString *)img name:(NSString *)name job:(NSString *)job bio:(NSString *)bio social_media:(NSMutableArray *)social_media{
    
    if (self = [super init]) {
        
        
        _img = img;
        _name = name;
        _job = job;
        _bio = bio;
        _social_media = social_media;
        
        
               
    }
    return self;

    
    
}

@end
