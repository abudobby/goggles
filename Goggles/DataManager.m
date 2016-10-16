//
//  QAData.m
//  Goggles
//
//  Created by Abdi on 10/16/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "DataManager.h"
#import "Reply.h"


@implementation DataManager



-(id) init{
    
    
    self = [super init];
    if (self) {
        
        
            }
    return self;

}

+(NSMutableArray *)questions{
    
    NSMutableArray* questions = [[NSMutableArray alloc]init];
    
    [questions addObject:[Question modelWithIcon:@"https://www.teamleader.cn/content/images/2016/09/teamleader.jpg" title:@"James" content:@"There are many variations of passages of Lorem Ipsum available, but..." avatar:@"katie@3x.jpg"]];
    [questions addObject:[Question modelWithIcon:@"https://www.teamleader.cn/content/images/2016/09/teamleader.jpg" title:@"Ashley" content:@"Melius accommodare an vim, eum utroque incorrupte et. In ipsum dicant vis, consul mucius debitis vim ea, vix veniam honestatis sadipscing no. Eros paulo usu ut. Ex eum veri aeterno, est in iisque lucilius elaboraret, ut duo malis labores pertinax." avatar:@"robert@3x.jpg"]];
    [questions addObject:[Question modelWithIcon:@"https://www.teamleader.cn/content/images/2016/09/teamleader.jpg" title:@"Kristen" content:@"Vide concludaturque te eum. Est ridens accusam liberavisse cu. In vim viris platonem salutandi, epicuri salutatus qui ea. Eu suscipit gloriatur reprehendunt has." avatar:@"tony@3x.jpg"]];
    [questions addObject:[Question modelWithIcon:@"https://www.teamleader.cn/content/images/2016/09/teamleader.jpg" title:@"Mike" content:@"Sea in antiopam principes, mucius semper nam eu. " avatar:@"stephanie@3x.jpg"]];
    

return questions;
}

+(NSMutableArray *)replies:(Question *)question{
    
    NSMutableArray* replies = [[NSMutableArray alloc]init];
    
    [replies addObject:[Reply initWithModel:question name:@"James Laftery" comment:@"Melius accommodare an vim, eum utroque incorrupte et. In ipsum dicant vis, consul mucius debitis vim ea, vix veniam honestatis sadipscing no." avatar:@"stephanie@3x.jpg"]];
    
    [replies addObject:[Reply initWithModel:question name:@"James Laftery" comment:@" eum utroque incorrupte et. In ipsum dicant vis, consul mucius debitis vim ea, vix veniam honestatis sadipscing no. Eros paulo usu ut." avatar:@"stephanie@3x.jpg"]];
    
    [replies addObject:[Reply initWithModel:question name:@"James Laftery" comment:@"Est ridens accusam liberavisse cu. In vim viris platonem salutandi, epicuri salutatus qui ea. Eu suscipit gloriatur reprehendunt." avatar:@"stephanie@3x.jpg"]];
  
    
    
    return replies;
}





@end
