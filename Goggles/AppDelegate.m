//
//  AppDelegate.m
//  no-storyboards
//
//  Created by GabrielMassana on 26/02/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "HomeViewController.h"
#import "TabViewController.h"
#import "SettingsViewController.h"



#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface AppDelegate ()

@property (nonatomic, strong) UIViewController *rootViewController;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) TabViewController *tabbar;

@property (strong, nonatomic) SettingsViewController *settings;





@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x3498db)];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    NSShadow *shadow = [[NSShadow alloc] init];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"AvenirNext-Regular" size:17.0], NSFontAttributeName, nil]];
    

    
    _tabbar = [[TabViewController alloc] init];
    _settings = [[SettingsViewController alloc] init];

    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:_settings];

    
    
//    UIColorFromRGB(0x23AEFC);
    

    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

#pragma mark - Window

- (UIWindow *)window
{
    if (!_window)
    {
        UITabBarController *tab = [[UITabBarController alloc] init];
        
        tab.viewControllers = @[self.rootViewController];

        
        
       
        
        [self.window makeKeyAndVisible];
        
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.rootViewController];


        _window.rootViewController = tab;
    }
    
    return _window;
}

#pragma mark - RootViewController

- (UIViewController *)rootViewController
{
    if (!_rootViewController)
    {
        
        _rootViewController = [[ViewController alloc] init];
    }
    
    return _rootViewController;
}

@end
