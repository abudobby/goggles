//
//  RepliesViewController.h
//  Goggles
//
//  Created by Abdi on 10/16/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"
#import "DataManager.h"

@interface RepliesViewController : UIViewController

@property (nonatomic, strong) Question *question;
@property (nonatomic, strong) DataManager *dataManager;
@property (nonatomic, strong) NSMutableArray *replies;



@end
