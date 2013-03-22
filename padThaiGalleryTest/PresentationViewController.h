//
//  PresentationViewController.h
//  padThaiGalleryTest
//
//  Created by Tim Moore on 3/22/13.
//  Copyright (c) 2013 Tim Moore. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PresentationCVLayout;
@class PhotoCVCell;

@interface PresentationViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate> {
 
    PresentationCVLayout * presentationLayout;
    PhotoCVCell * cell;
    
    NSArray *imageArray;
    
    BOOL reading;
    
}



@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UITextView *bodyText;

@end
