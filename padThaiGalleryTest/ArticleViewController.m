//
//  ArticleViewController.m
//  padThaiGalleryTest
//
//  Created by Tim Moore on 3/15/13.
//  Copyright (c) 2013 Tim Moore. All rights reserved.
//

#import "ArticleViewController.h"
#import "PhotoCVCell.h"
#import "ArticleCVLayout.h"
#import "PresentationCVLayout.h"
#import "ViewController.h"
#import "PresentationViewController.h"

@interface ArticleViewController ()

@end

@implementation ArticleViewController

@synthesize titleLabel;
@synthesize collectionView;
@synthesize pageControl;
@synthesize text;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)articleGallery{
    
    [articleLayout invalidateLayout];
    [self.collectionView setFrame:CGRectMake(0, 0, 768, 512)];
    [self.collectionView setCollectionViewLayout:articleLayout animated:YES];
    self.collectionView.allowsSelection = TRUE;
}





- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if(scrollView == text){
        
                
        
        
        int Position = (text.contentOffset.y);
        

        
        
        
        
        
        if (Position > 0 && Position < 200) {
            
            if (image0) {
                [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]  atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
                
                image0 = FALSE;
                
            }
            
            //image0 = TRUE;
            image1 = TRUE;
            image2 = TRUE;
            image3 = TRUE;
            image4 = TRUE;
        
            
            
            
        }
        
        
        else if (Position > 300 && Position < 500) {
            
            if (image1) {
                [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]  atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];

                
                image1 = FALSE;
                
            }
            
            
            image0 = TRUE;
            //image1 = TRUE;
            image2 = TRUE;
            image3 = TRUE;
            image4 = TRUE;
        
            
        }
        
        else if (Position > 600 && Position < 800) {
            
            if (image2) {
                [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]  atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
                
                image2 = FALSE;
                
            }
            
            
            image0 = TRUE;
            image1 = TRUE;
            //image2 = TRUE;
            image3 = TRUE;
            image4 = TRUE;
         
            
        }
        
        
        else if (Position > 900 && Position < 1000) {
            
            
            if (image3) {
                [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]  atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];

                
                
                image3 = FALSE;
                
            }
            
            
            image0 = TRUE;
            image1 = TRUE;
            image2 = TRUE;
            //image3 = TRUE;
            image4 = TRUE;
          
        }
        
        else if (Position > 1100 && Position < 1300) {
            
            
            if (image4) {
                [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]  atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
                
                image4 = FALSE;
                
            }
            
            
            image0 = TRUE;
            image1 = TRUE;
            image2 = TRUE;
            image3 = TRUE;
            // image4 = TRUE;
         
        }
        
             
        
        
        
    }
    
}













- (void)viewDidLoad
{
    
     articleLayout = [[ArticleCVLayout alloc]init];
    presentationLayout = [[PresentationCVLayout alloc]init];
    
    
    [super viewDidLoad];
    
    [self gestureCode];
    
    [self.collectionView setCollectionViewLayout:presentationLayout animated:YES];
     self.collectionView.allowsSelection = TRUE;

    [self.collectionView registerClass:[PhotoCVCell class] forCellWithReuseIdentifier:@"PhotoCVCell"];
    
    
    
    image0 = TRUE;
    image1 = TRUE;
    image2 = TRUE;
    image3 = TRUE;
    image4 = TRUE;
    
    
    
    imageArray = [NSArray arrayWithObjects:@"test01",
                  @"test02",
                  @"test03",
                  @"test04",
                  @"test05",
                  nil];
    
    
    
    [self.pageControl addTarget:self action:@selector(pageControlChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.pageControl.numberOfPages = [imageArray count];
    self.pageControl.autoresizingMask = UIViewAutoresizingFlexibleHeight;


}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
    
    
}






-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return [imageArray count];
}







-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"PhotoCVCell";
    cell = (PhotoCVCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    NSString *data = [imageArray objectAtIndex:indexPath.row];
    NSString *cellData = [[NSBundle mainBundle] pathForResource:data ofType:@"png"];
    [cell.ImageView setImage:[UIImage imageWithContentsOfFile:cellData]];
    [cell setContentMode:UIViewContentModeScaleAspectFill];
    
    
    return cell;
    
    
}







/*
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ViewController *vc = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    [self.navigationController presentViewController:vc
                                            animated:YES
                                          completion:^{
                                                }];

}
*/





- (void)pageControlChanged:(id)sender
{
    pageControl = sender;
    CGFloat pageWidth = self.collectionView.frame.size.width;
    CGPoint scrollTo = CGPointMake(pageWidth * pageControl.currentPage, 0);
    [self.collectionView setContentOffset:scrollTo animated:YES];
}






- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.collectionView.frame.size.width;
    self.pageControl.currentPage = self.collectionView.contentOffset.x / pageWidth;
}






-(void)gestureCode{
    
    
    /*
     UIPinchGestureRecognizer* pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
     [self.photoScroll addGestureRecognizer:pinchRecognizer];
     [self.photoScroll registerClass:[CVCell class] forCellWithReuseIdentifier:@"cvCell"];
     */
    
    

    // next Page
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(nextPage)];
    [leftSwipe setNumberOfTouchesRequired:1];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipe];
    

    
}





-(void)nextPage{
    
    
       PresentationViewController *vc =[[PresentationViewController alloc] initWithNibName:@"PresentationViewController" bundle:nil];
       [self.navigationController pushViewController:vc animated:YES];
        
       
}













@end
