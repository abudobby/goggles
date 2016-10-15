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
#import "CommentsViewCell.h"
#import "TableViewCell.h"
#import "TableViewModel.h"
#import "Comments.h"
#import "Inputbar.h"
#import "DAKeyboardControl.h"

static NSString *identifier = @"indentifier";

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

static CGFloat const MaxToolbarHeight = 200.0f;


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) UIView *videoView;
@property (nonatomic, copy) NSArray *dataList;
@property (nonatomic, assign) BOOL commentsDrawer;
@property (strong, nonatomic) IBOutlet Inputbar *inputbar;





@property (nonatomic, strong) Comments *tableView;






@end

@implementation ViewController{
    Player *player;
    AVPlayerViewController *playerController;
    UIToolbar *_toolbar;
    NSLayoutConstraint *headerViewTopLayout;
    UIImageView *cancel;
    UIView *headerView;
    UILabel *commentsLabel;


}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self videoView];
    [self setInputbar];

    
    

   
    _commentsDrawer = YES;

    
    
    
    
   
    
    
    
    headerView = [[UIView alloc] init];
    
    
    headerView.backgroundColor = [UIColor clearColor];
    headerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_videoView addSubview:headerView];

    
    
    UIImageView *chat = [[UIImageView alloc]init];
    
    chat.image = [UIImage imageNamed:@"arrow-up@3x.png"];

    
    
    chat.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    cancel = [[UIImageView alloc]init];
    cancel.alpha=0;

    cancel.image = [UIImage imageNamed:@"cancel-filled@3x.png"];
    
    
    
    chat.translatesAutoresizingMaskIntoConstraints = NO;
    cancel.translatesAutoresizingMaskIntoConstraints = NO;

    

    
    
    
    
    
    commentsLabel = [UILabel new];
    commentsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    commentsLabel.text = @"Q & A";
    commentsLabel.font = [UIFont fontWithName:@"AvenirNext-Medium" size:15];
    commentsLabel.textColor = [UIColor whiteColor];
    
    
    commentsLabel.textAlignment = NSTextAlignmentCenter;
    
    [headerView addSubview:commentsLabel];
    [headerView addSubview:chat];
    
    [headerView addSubview:cancel];


    
    [headerView addConstraint:[NSLayoutConstraint constraintWithItem:commentsLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeTop multiplier:1.0f constant:18]];

    [headerView addConstraint:[NSLayoutConstraint constraintWithItem:commentsLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    [headerView addConstraint:[NSLayoutConstraint constraintWithItem:chat attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeTop multiplier:1.0f constant:-5]];
    
    [headerView addConstraint:[NSLayoutConstraint constraintWithItem:chat attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    
    
    [headerView addConstraint:[NSLayoutConstraint constraintWithItem:cancel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeTop multiplier:1.0f constant:12]];
    
    [headerView addConstraint:[NSLayoutConstraint constraintWithItem:cancel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-10.0f]];


    
    
    [cancel addConstraint:[NSLayoutConstraint constraintWithItem:cancel
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute: NSLayoutAttributeNotAnAttribute
                                                    multiplier:1
                                                      constant:20]];
    
    [cancel addConstraint:[NSLayoutConstraint constraintWithItem:cancel
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute: NSLayoutAttributeNotAnAttribute
                                                    multiplier:1
                                                      constant:20]];


    
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [headerView addGestureRecognizer:singleFingerTap];

    
    
    
    headerViewTopLayout = [NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_videoView attribute:NSLayoutAttributeTop multiplier:1.0f constant:self.view.frame.size.height-50];
    
    
    
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_videoView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_videoView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
    
    [self.view addConstraint:headerViewTopLayout];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_videoView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];
    
    _tableView = [[Comments alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain videoView:headerView];
    
    
    _tableView.tableFooterView = [UIView new];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    
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
//        tableViewFrame.size.height = toolBarFrame.origin.y - 64;
        _tableView.frame = tableViewFrame;
        
        

        
    }];
    _inputbar.alpha = 0;

}


- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:[recognizer.view self]];
    
    NSLog(@"%f",location.y);
    
    
    if (_commentsDrawer && location.y<50) {
       
        headerViewTopLayout.constant = self.view.frame.size.height/2-100;
     

        [UIView animateWithDuration:0.5 animations:^{
            
            _inputbar.alpha = 1;
            cancel.alpha=1;
            headerView.backgroundColor = [UIColor whiteColor];
            commentsLabel.textColor = UIColorFromRGB(0x23AEFC);

            
            [self.view layoutIfNeeded];
        }];



    
    }
    else{
        
        headerViewTopLayout.constant = self.view.frame.size.height-50;
     
        [UIView animateWithDuration:0.5 animations:^{
            
            _inputbar.alpha = 0;
            headerView.backgroundColor = [UIColor clearColor];
            
            cancel.alpha=0;
            commentsLabel.textColor = [UIColor whiteColor];

            
            [self.view layoutIfNeeded];
        }];


    }

    
    _commentsDrawer = !_commentsDrawer;
    

    
    
}
-(void)setInputbar
{
    self.inputbar.placeholder = nil;
    self.inputbar.delegate = self;
//    self.inputbar.leftButtonImage = [UIImage imageNamed:@"share"];
    self.inputbar.rightButtonText = @"Send";
    self.inputbar.rightButtonTextColor = [UIColor colorWithRed:0 green:124/255.0 blue:1 alpha:1];
}













#pragma UI Elements


- (UIView *)headerView{
   _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)];
    
    
    UIButton *chat = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [chat setBackgroundImage:[UIImage imageNamed:@"chat@3x.png"] forState:UIControlStateNormal];
    
//    chat.backgroundColor = [UIColor whiteColor];
    
    chat.translatesAutoresizingMaskIntoConstraints = NO;


    [chat addTarget:self action:@selector(chatAction) forControlEvents:UIControlEventTouchUpInside];

    
    commentsLabel = [UILabel new];
    commentsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    commentsLabel.text = @"Questions";
    commentsLabel.font = [UIFont fontWithName:@"AvenirNext-Medium" size:17];
    commentsLabel.textColor = [UIColor whiteColor];
    
    
    commentsLabel.textAlignment = NSTextAlignmentCenter;
    
    [_headerView addSubview:commentsLabel];
    [_headerView addSubview:chat];
    
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [_headerView addGestureRecognizer:singleFingerTap];
    
    
    _headerView.backgroundColor = UIColorFromRGB(0x23AEFC);
    
    
      [_headerView addConstraint:[NSLayoutConstraint constraintWithItem:chat attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_headerView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    [chat addConstraint:[NSLayoutConstraint constraintWithItem:chat
                                                      attribute:NSLayoutAttributeWidth
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:nil
                                                      attribute: NSLayoutAttributeNotAnAttribute
                                                     multiplier:1
                                                       constant:20]];
    
    [chat addConstraint:[NSLayoutConstraint constraintWithItem:chat
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute: NSLayoutAttributeNotAnAttribute
                                                    multiplier:1
                                                      constant:20]];

    
    [_headerView addConstraint:[NSLayoutConstraint constraintWithItem:commentsLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_headerView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    
    [_headerView addConstraint:[NSLayoutConstraint constraintWithItem:chat attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_headerView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-25.0f]];
    
    [_headerView addConstraint:[NSLayoutConstraint constraintWithItem:commentsLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_headerView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
    
    [_headerView addConstraint:[NSLayoutConstraint constraintWithItem:commentsLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_headerView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
    
    
    return _headerView;
    
}

-(void)chatAction{
    
    
}

- (UIView *)videoView{
    
   _videoView = [[VideoPlayer alloc]init];
    _videoView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_videoView];
    
    
    UITextField *commentText = [[UITextField alloc]init];
    
    commentText.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_videoView addSubview:commentText];

    
    
    
    [commentText addConstraint:[NSLayoutConstraint constraintWithItem:commentText
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute: NSLayoutAttributeNotAnAttribute
                                                    multiplier:1
                                                      constant:30]];

    
    
   
        [_videoView addConstraint:[NSLayoutConstraint constraintWithItem:commentText attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_videoView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    [_videoView addConstraint:[NSLayoutConstraint constraintWithItem:commentText attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_videoView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_videoView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_videoView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_videoView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_videoView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];
    
    _videoView.translatesAutoresizingMaskIntoConstraints = NO;
    
    
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"150250" withExtension:@"mp4"];
    
    
    
    
        AVURLAsset *asset = [AVURLAsset assetWithURL: url];
    
        NSMutableArray *vids = [[NSMutableArray alloc] init];
    
        AVPlayerItem *item = [AVPlayerItem playerItemWithAsset: asset];
    
        [vids addObject:item];
    
        player = [Player thePlayer];
    
        [player setItems:vids];
    
    
    
    
        AVPlayerLayer *layer = (AVPlayerLayer *)_videoView.layer;
        layer.player = player.queuePlayer;
    
    player.queuePlayer.muted = YES;
    
    
    layer.player.actionAtItemEnd = AVPlayerActionAtItemEndNone;

    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playerItemDidReachEnd:)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:[layer.player currentItem]];
    
        [player play];
    

    return _videoView;
}


- (void)playerItemDidReachEnd:(NSNotification *)notification {
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero];
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



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



#pragma UI Elements



@end
