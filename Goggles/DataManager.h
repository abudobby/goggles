//
//  QAData.h
//  Goggles
//
//  Created by Abdi on 10/16/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface DataManager : NSObject



+(NSMutableArray *)questions;
+(NSMutableArray *)replies:(Question *)question;


@end
