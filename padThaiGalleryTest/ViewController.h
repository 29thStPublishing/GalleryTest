//
//  ViewController.h
//  padThaiGalleryTest
//
//  Created by Tim Moore on 3/14/13.
//  Copyright (c) 2013 Tim Moore. All rights reserved.
//

#import <UIKit/UIKit.h>


@class FullScreenCVLayout;
@class LandscapeCVLayout;
@class PhotoCVCell;

@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate> {
    
    
    FullScreenCVLayout *fullscreenLayout;
    LandscapeCVLayout *landscapeLayout;
    PhotoCVCell * cell;
    
    NSArray *imageArray;
    
    BOOL captionVisible;
    
}


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *captionButton;

@property (weak, nonatomic) IBOutlet UIView *popUpView;

- (IBAction)goBack:(id)sender;
- (IBAction)toggleCaption:(id)sender;

@end
