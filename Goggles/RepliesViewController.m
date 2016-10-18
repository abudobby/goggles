//
//  RepliesViewController.m
//  Goggles
//
//  Created by Abdi on 10/16/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "RepliesViewController.h"
#import "QuestionsTableView.h"
#import "ReplyHeader.h"
#import "Inputbar.h"
#import "DAKeyboardControl.h"
#import "CustomCell.h"
#import "RepliesViewCell.h"

static NSString *identifier = @"indentifier";

@interface RepliesViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) QuestionsTableView *tableView;
@property (strong, nonatomic) IBOutlet Inputbar *inputbar;



@property (nonatomic, strong) ReplyHeader *header;



@end

@implementation RepliesViewController


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    [_dataManager setRepliesData:_question];
    

    self.title = @"Replies";
    
   
    
    
    _header = [[ReplyHeader alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) question:_question];
    

    
    _tableView = [[QuestionsTableView alloc] initWithReplies:self.view.bounds style:UITableViewStylePlain videoView:self.view];
    
    _tableView.tableHeaderView = _header;
    
    _tableView.tableFooterView = [UIView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerClass:[RepliesViewCell class] forCellReuseIdentifier:identifier];

    
    _inputbar = [[Inputbar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)];
    
    
    
    self.view.keyboardTriggerOffset = _inputbar.frame.size.height;
    [self.view addKeyboardPanningWithActionHandler:^(CGRect keyboardFrameInView, BOOL opening, BOOL closing) {
        /*
         Try not to call "self" inside this block (retain cycle).
         But if you do, make sure to remove DAKeyboardControl
         when you are done with the view controller by calling:
         [self.view removeKeyboardControl];
         */
        
        CGRect toolBarFrame = _inputbar.frame;
        toolBarFrame.origin.y = keyboardFrameInView.origin.y - toolBarFrame.size.height;
        _inputbar.frame = toolBarFrame;
        CGRect tableViewFrame = _tableView.frame;
        _tableView.frame = tableViewFrame;
    }];
    [self.view addSubview:_inputbar];


    // Do any additional setup after loading the view.
}


#pragma tableview delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataManager.replyList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RepliesViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.reply = [_dataManager.replyList objectAtIndex:indexPath.row];
    

    
    
    return cell;
}
-(void)setInputbar
{
    self.inputbar.placeholder = nil;
    self.inputbar.delegate = self;
    self.inputbar.rightButtonText = @"Send";
    self.inputbar.rightButtonTextColor = [UIColor colorWithRed:0 green:124/255.0 blue:1 alpha:1];
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
