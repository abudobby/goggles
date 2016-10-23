//
//  QAData.m
//  Goggles
//
//  Created by Abdi on 10/16/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "DataManager.h"



@implementation DataManager{
    
    Question *quest1, *quest2, *quest3, *quest4;
}



-(id) init{
    
    
    self = [super init];
    if (self) {
        
        
        
        
            }
    
    return self;

}

-(void)getRemoteData{
    
    _hosts = [[NSMutableArray alloc]init];
    NSString *url = [[NSBundle mainBundle] pathForResource:@"remote_data" ofType:@"json"];
    NSData *remote = [[NSData alloc] initWithContentsOfFile:url];
    NSError *error;
    
    NSDictionary *remoteData = [NSJSONSerialization JSONObjectWithData:remote options:0 error:&error];
    
    NSMutableArray *datas = [remoteData[@"hosts"] copy];
    
    
    
    for (int i=0; i<datas.count; i++) {
        
        [_hosts addObject:[Host initWithDetails:datas[i][@"img"] name:datas[i][@"name"] job:datas[i][@"job"] bio:datas[i][@"bio"] social_media:datas[0][@"social_media"]]];
        
        
    }
    
    

}




-(void)setQuestionsData{
    
    _questionsList = [[NSMutableArray alloc]init];
    
    
    
quest1 =[Question modelWithIcon:@"https://www.teamleader.cn/content/images/2016/09/teamleader.jpg" title:@"Ashley" content:@"Thank you so much for hosting. Really loved you what you do. What advice would you give to undergad students looking into startups as a career?" avatar:@"katie@3x.jpg"];
    
    
    quest2 = [Question modelWithIcon:@"https://www.teamleader.cn/content/images/2016/09/teamleader.jpg" title:@"James" content:@"Was wondering what tips you picked up on the way that made you want to start your own company?" avatar:@"robert@3x.jpg"];
    
    quest3 = [Question modelWithIcon:@"https://www.teamleader.cn/content/images/2016/09/teamleader.jpg" title:@"Mike" content:@"If you have a great idea, what do you do next? I understand ideas are not everything but not knowing what is next confuses me" avatar:@"tony@3x.jpg"];
    
    
    quest4 = [Question modelWithIcon:@"https://www.teamleader.cn/content/images/2016/09/teamleader.jpg" title:@"Claire" content:@"Really cool story. I am inspried :)" avatar:@"stephanie@3x.jpg"];
    
    
    [quest1.replies addObject:[Reply initWithModel:@"Ema Chang" comment:@"I am also curious about this question!" avatar:@"stephanie@3x.jpg"]];
    
     [quest1.replies addObject:[Reply initWithModel:@"Kristy Johnson" comment:@"Great question! Try to focus on what your are passionate about! In underdrad you have plenty of opportunites to discover yourself!" avatar:@"katie@3x.jpg"]];
    
    [quest1.replies addObject:[Reply initWithModel:@"Robert Brooks" comment:@"Thanks!! " avatar:@"robert@3x.jpg"]];
    
    
    [_questionsList addObject:quest1];
    [_questionsList addObject:quest2];
    [_questionsList addObject:quest3];
    [_questionsList addObject:quest4];


    
    
    
    

}


-(void)addQuestion:(Question *)question{
    
    [_questionsList addObject:question];
    
    
}

-(void)addReply:(Question *)quest reply:(Reply *)reply{
    
    [quest.replies addObject:reply];
    

}





@end
