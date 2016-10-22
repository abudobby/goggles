//
//  Reply.m
//  Goggles
//
//  Created by Abdi on 10/16/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "Reply.h"

@implementation Reply

+ (instancetype)initWithModel:(NSString *)name comment:(NSString *)comment avatar:(NSString *)avatar{
    return [[self alloc] initWithQuestion:name comment:comment avatar:avatar];
}

- initWithQuestion:(NSString *)name comment:(NSString *)comment avatar:(NSString *)avatar {
    if (self = [super init]) {
        self.name = [name copy];
        self.comment = [comment copy];
        self.avatar = [avatar copy];
        
    }
    return self;
}

@end
