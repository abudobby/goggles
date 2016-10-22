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
#import "Question.h"
#import "QuestionsTableView.h"
#import "Inputbar.h"
#import "DAKeyboardControl.h"
#import "HeaderView.h"
#import "VideoView.h"
#import "DataManager.h"
#import "RepliesViewController.h"
#import "HPGrowingTextView.h"
#import "CustomCell.h"

static NSString *identifier = @"indentifier";

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//static CGFloat const MaxToolbarHeight = 200.0f;


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, InputbarDelegate>

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, copy) NSArray *dataList;
@property (nonatomic, assign) BOOL commentsDrawer;
@property (strong, nonatomic) IBOutlet Inputbar *inputbar;
@property (nonatomic, strong) QuestionsTableView *tableView;
@property (nonatomic, strong) HeaderView *header;
@property (nonatomic, strong) VideoView *videoView;
@property (nonatomic, strong) HPGrowingTextView *textView;
@property (nonatomic, strong) DataManager *dataManager;





@end

@implementation ViewController{
    Player *player;
    AVPlayerViewController *playerController;
    UIToolbar *_toolbar;
    NSLayoutConstraint *headerViewTopLayout;
    UIImageView *cancel;
    UILabel *commentsLabel;
    UISwipeGestureRecognizer *gestureRecognizer;
    UITapGestureRecognizer *singleFingerTap;
    
    UISwipeGestureRecognizer *dismiss;



}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _dataManager = [[DataManager alloc]init];
    
    [_dataManager setQuestionsData];
    
    
    _videoView = [[VideoView alloc]initWithFrame:self.view.bounds attachToView:self.view];
    
    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc]
                                    initWithBarButtonSystemItem:(UIBarButtonSystemItemStop)
                                    target:self
                                    action:@selector(dismiss:)];
    
    
    self.navigationItem.rightBarButtonItem = closeButton;
    
    _commentsDrawer = YES;
    _header = [[HeaderView alloc]initWithFrame:self.view.bounds attachToView:_videoView];
    singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    
    
    
    dismiss =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(dismiss:)];
    
    [dismiss setDirection:(UISwipeGestureRecognizerDirectionDown)];

    
    [_videoView addGestureRecognizer:dismiss];

    
    
    [_header.subHead addGestureRecognizer:singleFingerTap];
    _tableView = [[QuestionsTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain videoView:_header];
    
  gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [gestureRecognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
    [_header.subHead addGestureRecognizer:gestureRecognizer];
    
    
    
    _tableView.tableFooterView = [UIView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[CustomCell class] forCellReuseIdentifier:identifier];
    


    _inputbar = [[Inputbar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)];
    
    _inputbar.alpha = 0;
    [self setInputbar];

    
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
        
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    _tableView.hidden = NO;
    
    


}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    _tableView.hidden = YES;
    
    [[self navigationController] setNavigationBarHidden:NO animated:YES];


    


}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
  
}

- (void)dismiss:(UITapGestureRecognizer *)recognizer {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
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
    
    return [_dataManager.questionsList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.model = [_dataManager.questionsList objectAtIndex:indexPath.row];
    

    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    RepliesViewController *vc = [[RepliesViewController alloc]init];
    
    Question *quest = _dataManager.questionsList[indexPath.row];
    
    
    vc.question = [_dataManager.questionsList objectAtIndex:indexPath.row];
    vc.dataManager = _dataManager;
    vc.replies = quest.replies;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)inputbarDidPressRightButton:(Inputbar *)inputbar{
    
Question *newQuestion = [Question modelWithIcon:@"" title:@"Abdi Musse" content:inputbar.textView.text avatar:@"tony@3x.jpg"];
    
    [_dataManager addQuestion:newQuestion];
    
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:[_dataManager.questionsList count]-1 inSection:0];
    
    [_tableView insertRowsAtIndexPaths:@[indexPath1] withRowAnimation:UITableViewRowAnimationBottom];
    
    [self.tableView scrollToRowAtIndexPath:indexPath1
                          atScrollPosition:UITableViewScrollPositionBottom animated:YES];

    
    [self.view layoutIfNeeded];
    
    
    
    
}

-(void)inputbarDidBecomeFirstResponder:(Inputbar *)inputbar{
    
    _header.headerViewTopLayout.constant = 0;
    [UIView animateWithDuration:0.5 animations:^{
        _inputbar.alpha = 1;
        _header.cancel.alpha=1;
        _header.backgroundColor = [UIColor whiteColor];
        _header.commentsLabel.textColor = UIColorFromRGB(0x23AEFC);
        [self.view layoutIfNeeded];
    }];
    
    [[self navigationController] setNavigationBarHidden:YES animated:YES];

    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[_dataManager.questionsList count]-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];

    
    
}



#pragma actions

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:[recognizer.view self]];
    if (location.y<50) {
        if (_commentsDrawer) {
            [gestureRecognizer setDirection:(UISwipeGestureRecognizerDirectionDown)];

            
            _header.headerViewTopLayout.constant = self.view.frame.size.height/2-100;
            [UIView animateWithDuration:0.5 animations:^{
                _inputbar.alpha = 1;
                _header.cancel.alpha=1;
                _header.backgroundColor = [UIColor whiteColor];
                _header.commentsLabel.textColor = UIColorFromRGB(0x23AEFC);
                [self.view layoutIfNeeded];
            }];
        }
        else{
            [gestureRecognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];

            [_inputbar resignFirstResponder];
            _header.headerViewTopLayout.constant = self.view.frame.size.height-50;
            [UIView animateWithDuration:0.5 animations:^{
                _inputbar.alpha = 0;
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
