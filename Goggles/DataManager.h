//
//  QAData.h
//  Goggles
//
//  Created by Abdi on 10/16/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"
#import "Reply.h"

@interface DataManager : NSObject

@property (nonatomic, strong) NSMutableArray *questionsList;
@property (nonatomic, strong) NSMutableArray *replyList;




-(void)setQuestionsData;
-(void)setRepliesData:(Question *)question;
-(void)addQuestion:(Question *)question;
-(void)addReply:(Question *)quest reply:(Reply *)reply;


@end
