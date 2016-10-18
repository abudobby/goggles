//
//  CustomCell.h
//  Goggles
//
//  Created by Abdi on 10/17/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"

@class Question;


@interface CustomCell : UITableViewCell{
    UILabel *questionLabel;
    UILabel *user;
    UIImageView *avater;
    
}

@property (nonatomic, strong) Question *model;




@end
