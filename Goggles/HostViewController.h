//
//  HostViewController.h
//  Goggles
//
//  Created by Abdi on 10/21/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HostViewController : UIViewController
@property (assign, nonatomic) NSInteger index;

@property (nonatomic, strong) UIImageView *img;

@property (nonatomic, strong) NSMutableDictionary *host;


@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *company;
@property (nonatomic, strong) UILabel *bio;


@end
