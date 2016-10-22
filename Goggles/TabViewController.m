//
//  TabViewController.m
//  Squoria
//
//  Created by Abdi on 6/25/16.
//  Copyright © 2016 Squoria, Inc. All rights reserved.
//
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "TabViewController.h"
#import "HomeViewController.h"
#import "CamViewController.h"
#import "ProfileViewController.h"


@interface TabViewController ()


@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
  
    
    
    
    HomeViewController* vc1 = [[HomeViewController alloc] init];
    CamViewController* vc2 = [[CamViewController alloc] init];
    ProfileViewController* vc3 = [[ProfileViewController alloc] init];
    
    UINavigationController* VC1Navigation = [[UINavigationController alloc]
                                             initWithRootViewController:vc1];
    
    UINavigationController* VC3Navigation = [[UINavigationController alloc]
                                             initWithRootViewController:vc3];

    
    NSArray* controllers = [NSArray arrayWithObjects:VC1Navigation, vc2,VC3Navigation, nil];
    self.viewControllers = controllers;
    
    
    [[UITabBar appearance] setTintColor:UIColorFromRGB(0x0EADFF)];

    
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];


    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    [self.tabBar setClipsToBounds:TRUE];
    
    
    [[self.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"home@3x.png"]];
    [[self.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"cam@3x.png"]];
    [[self.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"prof@3x.png"]];


    
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item  {
    
    
    
    long barItem = [[tabBar items] indexOfObject:item];
    
    

    
    if(barItem == 1){
        
        
        
        
        CGRect rect = CGRectMake(0, 0, 1, 1);
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, 1.0);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
        CGContextFillRect(context, rect);
        UIImage *transparentImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [self.tabBar setBackgroundImage:transparentImage];
        [self.tabBar setShadowImage:transparentImage];
        
        UITabBarItem *item0 = [self.tabBar.items objectAtIndex:0];
        //unselected icon
        item0.image = [[UIImage imageNamed:@"home-white@3x.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
//        [self.tabBar.items objectAtIndex:2].image = [[UIImage imageNamed:@"chat-white@3x.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        
        item.image=nil;
        
        
    }
    
    if (barItem == 2) {
        [[self.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"cam@3x.png"]];
        [[self.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"home@3x.png"]];
//        [[self.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"chat@3x.png"]];
        [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];




    }
    if (barItem == 0) {
        [[self.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"cam@3x.png"]];
        [[self.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"home@3x.png"]];
//        [[self.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"chat@3x.png"]];
        [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];


        
    }

    
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
