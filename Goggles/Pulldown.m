//
//  Pulldown.m
//  Goggles
//
//  Created by Abdi on 10/22/16.
//  Copyright © 2016 Goggles. All rights reserved.
//

#import "Pulldown.h"



@implementation Pulldown

-(id) init{
    
    self = [super init];
    
    if (self) {
        
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
        
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];

        
        
        _nextCollection = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:layout];
        
        
        _nextCollection.translatesAutoresizingMaskIntoConstraints = NO;
        _nextCollection.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        
        [self addSubview:_nextCollection];
        
        
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_nextCollection attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0f constant:20]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_nextCollection attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_nextCollection attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_nextCollection attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0]];

        
               
        
    }
    
    return self;
}


@end
