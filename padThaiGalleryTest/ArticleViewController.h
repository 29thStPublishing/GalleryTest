//
//  ArticleViewController.h
//  padThaiGalleryTest
//
//  Created by Tim Moore on 3/15/13.
//  Copyright (c) 2013 Tim Moore. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ArticleCVLayout;
@class PhotoCVCell;

@interface ArticleViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate> {
    
    ArticleCVLayout *articleLayout;
    PhotoCVCell * cell;
    
    NSArray *imageArray;
    
    BOOL reading;
    
}

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITextView *text;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end
