//
//  Reply.m
//  Goggles
//
//  Created by Abdi on 10/16/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "Reply.h"

@implementation Reply

+ (instancetype)initWithModel:(Question *)question name:(NSString *)name comment:(NSString *)comment avatar:(NSString *)avatar{
    return [[self alloc] initWithQuestion:question name:name comment:comment avatar:avatar];
}

- initWithQuestion:(Question *)question name:(NSString *)name comment:(NSString *)comment avatar:(NSString *)avatar {
    if (self = [super init]) {
        self.question = question;
        self.name = [name copy];
        self.comment = [comment copy];
        self.avatar = [avatar copy];
        
    }
    return self;
}

@end
