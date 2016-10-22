//
//  HomeViewController.m
//  Goggles
//
//  Created by Abdi on 10/21/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "HostViewController.h"
#import "HomeViewController.h"



#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface HomeViewController ()

@end

@implementation HomeViewController{
    
    NSMutableArray *hosts;
    NSMutableDictionary *host1, *host2, *host3;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    hosts = [[NSMutableArray alloc]init];
    
    UIImage *img1 = [UIImage imageNamed:@"me.jpg"];
    UIImage *img2 = [UIImage imageNamed:@"sam.jpeg"];
    UIImage *img3 = [UIImage imageNamed:@"thomas.jpeg"];

    
    
    host1=[[NSMutableDictionary alloc] initWithCapacity:4];
    [host1 setValue:img1 forKey:@"img"];
    [host1 setValue:@"Abdi" forKey:@"name"];
    
    [host1 setValue:@"UX Designer at PayPal" forKey:@"company"];

    [host1 setValue:@"I am a UX designer at Paypal. graduated from Carnegie Mellon University in Pittsburgh, Pennsylvania. Today I will show you that projects I am working on and hopefully answer some of you questions! Thanks for tuning in." forKey:@"bio"];
    
    
    host2=[[NSMutableDictionary alloc] initWithCapacity:4];
    [host2 setValue:img2 forKey:@"img"];
    [host2 setValue:@"Samantha" forKey:@"name"];
    
    [host2 setValue:@"Interaction Designer at Facebook" forKey:@"company"];
    
    [host2 setValue:@"I love colors and making great shit happen. The best is yet to come!" forKey:@"bio"];
    
    
    host3=[[NSMutableDictionary alloc] initWithCapacity:4];
    [host3 setValue:img3 forKey:@"img"];
    [host3 setValue:@"Thomas" forKey:@"name"];
    
    [host3 setValue:@"VP of Design at Airbnb" forKey:@"company"];
    
    [host3 setValue:@"I lead one of the smartest designers ever as we change the world....again! Ask me anything! :)" forKey:@"bio"];
    
    
    
    [hosts addObject:host1];
    [hosts addObject:host2];
    [hosts addObject:host3];

    
    
    

    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.navigationController.navigationBar.topItem.title = @"Today's Host";
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    HostViewController *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];

    // Do any additional setup after loading the view.
}
- (HostViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    HostViewController* childViewController = [[HostViewController alloc] init];
    
    childViewController.host = [hosts objectAtIndex:index];
    
  
    childViewController.index = index;
    
    return childViewController;
    
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(HostViewController *)viewController index];
    
    if (index == 0) {
        return nil;
    }
    
    // Decrease the index by 1 to return
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(HostViewController *)viewController index];
    
    index++;
    
    if (index == [hosts count]) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 5;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
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
