//
//  Comments.m
//  Goggles
//
//  Created by Abdi on 10/8/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "Comments.h"
#import "TableViewCell.h"
#import "TableViewCell.h"
#import "TableViewModel.h"

@implementation Comments

static NSString *identifier = @"indentifier";

-(id) initWithFrame:(CGRect)frame style:(UITableViewStyle)style videoView:(UIView *)videoView
{
    self = [super initWithFrame:frame style:style];
    if (self) {
//        self.delegate=self;
//        self.dataSource=self;
        
        self.estimatedRowHeight = 80;
        self.rowHeight = UITableViewAutomaticDimension;
        self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.backgroundColor = [UIColor clearColor];
        
        //    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.separatorColor = [UIColor groupTableViewBackgroundColor];
        
        
        [self registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier];
        
        
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        
        [videoView addSubview:self];
        
        [videoView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:
                                  NSLayoutRelationEqual toItem:videoView attribute:NSLayoutAttributeTop multiplier:1.0f constant:50]];
        
        [videoView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:
                                   NSLayoutRelationEqual toItem:videoView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
        
        [videoView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:videoView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
        
        
        
        
        [videoView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:frame.size.height/2]];
        
        
        // Initialization code
    }
    return self;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //put your values, this is part of my code
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30.0f)];
    [view setBackgroundColor:[UIColor redColor]];
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 150, 20)];
    [lbl setFont:[UIFont systemFontOfSize:18]];
    [lbl setTextColor:[UIColor blueColor]];
    [view addSubview:lbl];
    
    NSLog(@"hi");
    
    [lbl setText:[NSString stringWithFormat:@"Section: %ld",(long)section]];
    
    return view;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}


// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}



// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    
    
    //    cell.textLabel.text = @"YOOO";
    
    cell.model = [self.dataList objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSArray *)dataList {
    if (_dataList == nil) {
        NSMutableArray *array = [NSMutableArray array];
        
        [array addObject:[TableViewModel modelWithIcon:@"https://www.teamleader.cn/content/images/2016/09/teamleader.jpg" title:@"James" content:@"There are many variations of passages of Lorem Ipsum available, but..." avatar:@"katie@3x.jpg"]];
        [array addObject:[TableViewModel modelWithIcon:@"https://www.teamleader.cn/content/images/2016/09/teamleader.jpg" title:@"Ashley" content:@"Melius accommodare an vim, eum utroque incorrupte et. In ipsum dicant vis, consul mucius debitis vim ea, vix veniam honestatis sadipscing no. Eros paulo usu ut. Ex eum veri aeterno, est in iisque lucilius elaboraret, ut duo malis labores pertinax." avatar:@"robert@3x.jpg"]];
        [array addObject:[TableViewModel modelWithIcon:@"https://www.teamleader.cn/content/images/2016/09/teamleader.jpg" title:@"Kristen" content:@"Vide concludaturque te eum. Est ridens accusam liberavisse cu. In vim viris platonem salutandi, epicuri salutatus qui ea. Eu suscipit gloriatur reprehendunt has." avatar:@"tony@3x.jpg"]];
        [array addObject:[TableViewModel modelWithIcon:@"https://www.teamleader.cn/content/images/2016/09/teamleader.jpg" title:@"Mike" content:@"Sea in antiopam principes, mucius semper nam eu. " avatar:@"stephanie@3x.jpg"]];
        
        _dataList = [array copy];
    }
    return _dataList;
}




@end
