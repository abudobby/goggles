//
//  Host.h
//  Goggles
//
//  Created by Abdi on 10/23/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Host : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *job;
@property (nonatomic, strong) NSString *bio;

@property (nonatomic, strong) NSMutableArray *social_media;




+ (instancetype)initWithDetails:(NSString *)img name:(NSString *)name job:(NSString *)job bio:(NSString *)bio social_media:(NSMutableArray *)social_media;


@end
