//
//  TableViewModel.h
//  UITableViewCellAutolayout
//
//  Created by hejun on 9/27/16.
//  Copyright © 2016 teamleader. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic, copy) NSString *iconUrl;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, strong) NSMutableArray *replies;



+ (instancetype)modelWithIcon:(NSString *)icon title:(NSString *)title content:(NSString *)content avatar:(NSString *)avatar;
@end
