//
//  Comments.h
//  Goggles
//
//  Created by Abdi on 10/8/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionsTableView : UITableView
@property (nonatomic, copy) NSArray *dataList;

@property (nonatomic, strong) NSLayoutConstraint *tablePosition;

@property (nonatomic, strong) NSLayoutConstraint *bottom;


-(id) initWithFrame:(CGRect)frame style:(UITableViewStyle)style videoView:(UIView *)videoView;
-(id) initWithReplies:(CGRect)frame style:(UITableViewStyle)style videoView:(UIView *)videoView;

@end
