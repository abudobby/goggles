//
//  TableViewCell.h
//  UITableViewCellAutolayout
//
//  Created by hejun on 9/27/16.
//  Copyright © 2016 teamleader. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Question;

@interface TableViewCell : UITableViewCell

@property (nonatomic, strong) Question *model;

@end
