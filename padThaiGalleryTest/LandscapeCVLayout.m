//
//  FullScreenCVLayout.m
//  PhotoGalleryDemo
//
//  Created by Tim Moore on 2/26/13.
//  Copyright (c) 2013 Tim Moore. All rights reserved.
//

#import "LandscapeCVLayout.h"


#define kItemHeight 768
#define kItemWidth 1024
#define kMinimumLineSpacing 0

@implementation LandscapeCVLayout




-(id)init
{
    
 if (!(self = [super init])) return nil;
    
        
        self.itemSize = CGSizeMake(kItemWidth, kItemHeight);
        [self setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        [self setSectionInset:UIEdgeInsetsMake(0, 0, 0, 0)];
        [self setMinimumLineSpacing:kMinimumLineSpacing];
        
        
        
    
    return self;
    
}





-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}





@end
