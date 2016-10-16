//
//  TableViewModel.m
//  UITableViewCellAutolayout
//
//  Created by hejun on 9/27/16.
//  Copyright © 2016 teamleader. All rights reserved.
//

#import "Question.h"

@implementation Question

+ (instancetype)modelWithIcon:(NSString *)icon title:(NSString *)title content:(NSString *)content avatar:(NSString *)avatar{
	return [[self alloc] initWithIcon:icon title:title content:content avatar:avatar];
}

- initWithIcon:(NSString *)icon title:(NSString *)title content:(NSString *)content avatar:(NSString *)avatar {
	if (self = [super init]) {
		self.iconUrl = [icon copy];
		self.title = [title copy];
		self.content = [content copy];
        self.avatar = [avatar copy];

	}
	return self;
}

@end
