//
//  PresentationCVLayout.m
//  padThaiGalleryTest
//
//  Created by Tim Moore on 3/22/13.
//  Copyright (c) 2013 Tim Moore. All rights reserved.
//

#import "PresentationCVLayout.h"

#define kItemHeight 420
#define kItemWidth 630
#define kMinimumLineSpacing 0

@implementation PresentationCVLayout





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
