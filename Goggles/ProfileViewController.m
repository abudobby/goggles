//
//  ProfileViewController.m
//  Goggles
//
//  Created by Abdi on 10/21/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(30, 200, 100, 30)];
    text.text = @"Profile";
    
    NSLog(@"ONe");
    
    [self.view addSubview:text];
    // Do any additional setup after loading the view.
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
