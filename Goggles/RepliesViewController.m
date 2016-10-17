//
//  RepliesViewController.m
//  Goggles
//
//  Created by Abdi on 10/16/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "RepliesViewController.h"
#import "QuestionsTableView.h"
#import "TableViewCell.h"
#import "DataManager.h"
#import "ReplyHeader.h"


static NSString *identifier = @"indentifier";

@interface RepliesViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) QuestionsTableView *tableView;

@property (nonatomic, strong) ReplyHeader *header;



@end

@implementation RepliesViewController


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Replies";
    
    
    _header = [[ReplyHeader alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) question:_question];
    

    
    _tableView = [[QuestionsTableView alloc] initWithReplies:self.view.bounds style:UITableViewStylePlain videoView:self.view];
    
    _tableView.tableHeaderView = _header;
    
    _tableView.tableFooterView = [UIView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;

    // Do any additional setup after loading the view.
}


#pragma tableview delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return [[DataManager questions] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.model = [[DataManager questions] objectAtIndex:indexPath.row];
    cell.replies.hidden =YES;
    
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
