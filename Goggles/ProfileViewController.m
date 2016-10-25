//
//  HomeViewController.m
//  Goggles
//
//  Created by Abdi on 10/21/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileView.h"
#import "ViewController.h"
#import "CollectionViewCell.h"
#import "NextCollectionViewCell.h"
#import "DataManager.h"
#import "Host.h"


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ProfileViewController ()
@property (nonatomic, strong) ProfileView* hostview;
@property (nonatomic, strong) DataManager* dataManager;
@property (nonatomic, strong) Host* host;

@property (nonatomic, strong) NSMutableArray* hostList;



@end

@implementation ProfileViewController{
    UITapGestureRecognizer *singleFingerTap;
    BOOL open;
    UISwipeGestureRecognizer *swipeDown;
    NSMutableArray *days;
    NSMutableArray *SMPics;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataManager = [[DataManager alloc] init];
    [_dataManager getRemoteData];
    
    _hostList = _dataManager.hosts;
    _host = [_hostList objectAtIndex:0];
    
    
    [self setUpView];
    [self setUpHost];
    
    days = [[NSMutableArray alloc]initWithObjects:@"Tomorrow",@"Tuesday",@"Wednesday",@"Thursday", nil];
    SMPics = [[NSMutableArray alloc]initWithObjects:@"linkedin@3x.png",@"ig@3x.png",@"tweet@3x.png",@"fb@3x.png", nil];
    
    
}


#pragma setupViews



-(void)setUpView{
    
    open = NO;
    _hostview = [[ProfileView alloc] initWithFrame:self.view.frame attachToView:self.view];
    
    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"setting@3x.png"] style:UIBarButtonItemStylePlain target:self action:@selector(settings:)];
    self.navigationItem.rightBarButtonItem = closeButton;
    
    
    swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
    [swipeDown setDirection:(UISwipeGestureRecognizerDirectionDown)];
    singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    
    [_hostview addGestureRecognizer:singleFingerTap];
    _hostview.collectV.delegate = self;
    _hostview.collectV.dataSource = self;
    [_hostview.pulldown.nextCollection setShowsHorizontalScrollIndicator:NO];
    _hostview.pulldown.nextCollection.delegate =self;
    _hostview.pulldown.nextCollection.dataSource =self;
    [_hostview.collectV registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_hostview.pulldown.nextCollection registerClass:[NextCollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_hostview addGestureRecognizer:swipeDown];
    
    
    self.navigationController.navigationBar.topItem.title = @"Profile";
    
    
    
}

-(void)settings:(UIButton *)sender{
    


}

-(void)setUpHost{
    
    _hostview.img.image = [UIImage imageNamed:_host.img];
    _hostview.name.text = _host.name;
    _hostview.company.text = _host.job;
    _hostview.bio.text = _host.bio;
    
    
}


#pragma collectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView ==  _hostview.collectV ){
        
        return _host.social_media.count;
        
    }
    else{
        return _hostList.count-1;
        
        
    }
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (collectionView ==  _hostview.collectV ) {
        CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
        
        cell.icon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[SMPics objectAtIndex:indexPath.row]]];
        
        cell.backgroundColor=[UIColor whiteColor];
        return cell;
        
    }
    else{
        NextCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
        
        Host *upcomingHost = [[Host alloc]init];
        
        upcomingHost = [_hostList objectAtIndex:indexPath.row+1];
        
        cell.handle.text = [days objectAtIndex:indexPath.row];
        cell.icon.image = [UIImage imageNamed:upcomingHost.img];
        cell.name.text = upcomingHost.name;
        cell.company.text = upcomingHost.job;
        
        cell.backgroundColor=[UIColor whiteColor];
        return cell;
        
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (collectionView ==  _hostview.collectV ) {
        return CGSizeMake(50, 50);
        
    }
    else{
        return CGSizeMake(125, 125);
    }
}






#pragma gesture handlers

-(void)dismiss:(UISwipeGestureRecognizer *)recognizer{
    
    if (!open) {
        [swipeDown setDirection:(UISwipeGestureRecognizerDirectionUp)];
        
        _hostview.heightP.constant = 150;
        
    }
    else{
        [swipeDown setDirection:(UISwipeGestureRecognizerDirectionDown)];
        
        _hostview.heightP.constant = 0;
        
    }
    [UIView animateWithDuration:0.5 animations:^{
        
        [self.view layoutIfNeeded];
        
    }];
    
    open = !open;
    
}
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    
    ViewController *vc = [[ViewController alloc] init];
    
    UINavigationController* VC1Navigation = [[UINavigationController alloc]
                                             initWithRootViewController:vc];
    
    
    [self.navigationController presentModalViewController:VC1Navigation animated:YES];
    
    
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
