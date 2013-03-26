//
//  FullScreenCVLayout.m
//  PhotoGalleryDemo
//
//  Created by Tim Moore on 2/26/13.
//  Copyright (c) 2013 Tim Moore. All rights reserved.
//

#import "FullScreenCVLayout.h"
 

#define kItemHeight 1024
#define kItemWidth 768
    
#define kMinimumLineSpacing 0
#define kMinimumItemSpacing 0



@implementation FullScreenCVLayout




-(id)init
{
    
 if (!(self = [super init])) return nil;
    
        self.itemSize = CGSizeMake(kItemWidth, kItemHeight);
        [self setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        [self setSectionInset:UIEdgeInsetsMake(0, 0, 0, 0)];
        [self setMinimumLineSpacing:kMinimumLineSpacing];
        [self setMinimumInteritemSpacing:kMinimumItemSpacing];
    
        
        
    
    return self;
    
}





-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}




@end
