//
//  PresentationViewController.m
//  padThaiGalleryTest
//
//  Created by Tim Moore on 3/22/13.
//  Copyright (c) 2013 Tim Moore. All rights reserved.
//

#import "PresentationViewController.h"
#import "ArticleViewController.h"
#import "PhotoCVCell.h"
#import "PresentationCVLayout.h"
#import "ViewController.h"

@interface PresentationViewController ()

@end

@implementation PresentationViewController

@synthesize titleLabel;
@synthesize collectionView;
@synthesize bodyText;
@synthesize pageControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)presentationGallery{
    
    [presentationLayout invalidateLayout];
    [self.collectionView setFrame:CGRectMake(0, 0, 630, 420)];
    [self.collectionView setCollectionViewLayout:presentationLayout animated:YES];
    self.collectionView.allowsSelection = TRUE;
}


- (void)viewDidLoad
{
    
    presentationLayout = [[PresentationCVLayout alloc]init];
    [super viewDidLoad];
    
    [self gestureCode];
    
    [self.collectionView setCollectionViewLayout:presentationLayout animated:YES];
    self.collectionView.allowsSelection = TRUE;
    
    [self.collectionView registerClass:[PhotoCVCell class] forCellWithReuseIdentifier:@"PhotoCVCell"];
    
    
    imageArray = [NSArray arrayWithObjects:@"dont01",
                  @"dont02",
                  @"dont03",
                  @"dont04",
                  @"dont05",
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
    
    
    
    return cell;
    
    
}




/*

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ViewController *vc = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    
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



-(void)lastPage{
    
    
  //  ArticleViewController *vc =[[ArticleViewController alloc] initWithNibName:@"ArticleViewController" bundle:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
    

}



-(void)gestureCode{
    
    
    /*
     UIPinchGestureRecognizer* pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
     [self.photoScroll addGestureRecognizer:pinchRecognizer];
     [self.photoScroll registerClass:[CVCell class] forCellWithReuseIdentifier:@"cvCell"];
     */
    
    
    
    
    // last Page
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(lastPage)];
    [rightSwipe setNumberOfTouchesRequired:1];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipe];
    
    
       
    
    
}







@end
