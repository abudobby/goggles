//
//  AppDelegate.m
//  no-storyboards
//
//  Created by GabrielMassana on 26/02/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "RepliesViewController.h"


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface AppDelegate ()

@property (nonatomic, strong) UIViewController *rootViewController;


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
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.clipsToBounds = NO;
    [self.window makeKeyAndVisible];
    
    return YES;
}

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
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.rootViewController];


        _window.rootViewController = nav;
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
