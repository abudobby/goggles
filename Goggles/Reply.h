//
//  Reply.h
//  Goggles
//
//  Created by Abdi on 10/16/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface Reply : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, strong) Question *question;



+ (instancetype)initWithModel:(Question *)question name:(NSString *)name comment:(NSString *)comment avatar:(NSString *)avatar;
@end
