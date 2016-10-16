//
//  ViewController.m
//  no-storyboards
//
//  Created by GabrielMassana on 26/02/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "VideoPlayer.h"
#import "Player.h"
#import "TableViewCell.h"
#import "Question.h"
#import "QuestionsTableView.h"
#import "Inputbar.h"
#import "DAKeyboardControl.h"
#import "HeaderView.h"
#import "VideoView.h"
#import "DataManager.h"
#import "RepliesViewController.h"

static NSString *identifier = @"indentifier";

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//static CGFloat const MaxToolbarHeight = 200.0f;


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, copy) NSArray *dataList;
@property (nonatomic, assign) BOOL commentsDrawer;
@property (strong, nonatomic) IBOutlet Inputbar *inputbar;
@property (nonatomic, strong) QuestionsTableView *tableView;
@property (nonatomic, strong) HeaderView *header;
@property (nonatomic, strong) VideoView *videoView;



@end

@implementation ViewController{
    Player *player;
    AVPlayerViewController *playerController;
    UIToolbar *_toolbar;
    NSLayoutConstraint *headerViewTopLayout;
    UIImageView *cancel;
    UILabel *commentsLabel;


}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _videoView = [[VideoView alloc]initWithFrame:self.view.bounds attachToView:self.view];
    
    [self setInputbar];
    _commentsDrawer = YES;
    _header = [[HeaderView alloc]initWithFrame:self.view.bounds attachToView:_videoView];
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [_header.subHead addGestureRecognizer:singleFingerTap];
    _tableView = [[QuestionsTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain videoView:_header];
    _tableView.tableFooterView = [UIView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;

        
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    


}
-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];


}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    _inputbar = [[Inputbar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)];
    

    [_videoView addSubview:_inputbar];
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
    
    _inputbar.hidden = YES;

}

-(void)setInputbar
{
    self.inputbar.placeholder = nil;
    self.inputbar.delegate = self;
    self.inputbar.rightButtonText = @"Send";
    self.inputbar.rightButtonTextColor = [UIColor colorWithRed:0 green:124/255.0 blue:1 alpha:1];
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    RepliesViewController *vc = [[RepliesViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma actions

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:[recognizer.view self]];
    if (location.y<50) {
        if (_commentsDrawer) {
            _header.headerViewTopLayout.constant = self.view.frame.size.height/2-100;
            [UIView animateWithDuration:0.5 animations:^{
                _inputbar.hidden = NO;
                _header.cancel.alpha=1;
                _header.backgroundColor = [UIColor whiteColor];
                _header.commentsLabel.textColor = UIColorFromRGB(0x23AEFC);
                [self.view layoutIfNeeded];
            }];
        }
        else{
            
            NSLog(@"yo");
            _header.headerViewTopLayout.constant = self.view.frame.size.height-50;
            [UIView animateWithDuration:0.5 animations:^{
                _inputbar.hidden = YES;
                _header.backgroundColor = [UIColor clearColor];
                _header.cancel.alpha=0;
                _header.commentsLabel.textColor = [UIColor whiteColor];
                [self.view layoutIfNeeded];
            }];
        }
        _commentsDrawer = !_commentsDrawer;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
