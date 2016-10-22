//
//  HostViewController.m
//  Goggles
//
//  Created by Abdi on 10/21/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "HostViewController.h"
#import "HostView.h"
#import "ViewController.h"

@interface HostViewController ()
@property (nonatomic, strong) HostView* hostview;

@end

@implementation HostViewController{
    UITapGestureRecognizer *singleFingerTap;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _hostview = [[HostView alloc] initWithFrame:self.view.frame attachToView:self.view];
    
    singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [_hostview addGestureRecognizer:singleFingerTap];

    
    
    _hostview.img.image = [_host objectForKey:@"img"];
    
    _hostview.name.text = [_host objectForKey:@"name"];

    
    _hostview.company.text = [_host objectForKey:@"company"];
    
    _hostview.bio.text = [_host objectForKey:@"bio"];


    
    
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
        

    // Do any additional setup after loading the view.
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
