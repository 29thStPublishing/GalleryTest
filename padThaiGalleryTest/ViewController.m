//
//  ViewController.m
//  padThaiGalleryTest
//
//  Created by Tim Moore on 3/14/13.
//  Copyright (c) 2013 Tim Moore. All rights reserved.
//

#import "ViewController.h"
#import "ArticleCVLayout.h"
#import "FullScreenCVLayout.h"
#import "PhotoCVCell.h"
#import "LandscapeCVLayout.h"
#import "PresentationViewController.h"


@interface ViewController ()

@end

@implementation ViewController


@synthesize collectionView;
@synthesize pageControl;
@synthesize popUpView;






- (void)portraitGallery{
    
    [fullscreenLayout invalidateLayout];
    [self.collectionView setFrame:CGRectMake(0, 0, 768, 1024)];
    [self.collectionView setCollectionViewLayout:fullscreenLayout animated:YES];
    self.collectionView.allowsSelection = TRUE;
 
}






- (void)landscapeGallery{
    
    [landscapeLayout invalidateLayout];
    [self.collectionView setFrame:CGRectMake(0, 0, 1024, 768)];
    [self.collectionView setCollectionViewLayout:landscapeLayout animated:YES];
    self.collectionView.allowsSelection = FALSE;


}


- (void)loadLayouts{
    
    fullscreenLayout = [[FullScreenCVLayout alloc]init];
    landscapeLayout = [[LandscapeCVLayout alloc]init];
    
    
}






- (void)viewDidLoad
{
    
    [self loadLayouts];

    [super viewDidLoad];
     UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
   
    
    if (orientation == UIDeviceOrientationPortrait) {
        
        [self.popUpView setFrame:CGRectMake(768, 0, 300, 1024)];
        [self portraitGallery];
    }else{
        [self.popUpView setFrame:CGRectMake(1024, 0, 300, 768)];
        [self landscapeGallery];
    }
    
    captionVisible = FALSE;
    
    [self.collectionView registerClass:[PhotoCVCell class] forCellWithReuseIdentifier:@"PhotoCVCell"];
    
    
    imageArray = [NSArray arrayWithObjects:@"test01",
                  @"test02",
                  @"test03",
                  @"test04",
                  @"test05",
                  nil];
 
    
    
    [self.pageControl addTarget:self action:@selector(pageControlChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.pageControl.numberOfPages = [imageArray count];
    self.pageControl.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
	// Do any additional setup after loading the view, typically from a nib.
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
    
    
}







//we define the number of items there are in the slideshow by how many are in our array of images


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return [imageArray count];
}




//setup our CollectionViewCell to load the right image in the array


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
    
    
    

        if (reading) {
            
            
            
            [self portraitGallery];
            
            reading =FALSE;
            
            
            
        } else {
            
            
            
            [self articleGallery];
            
            reading =TRUE;
        }
    
}


*/




-(BOOL)shouldAutorotate{
    
    return YES;
    
}


-(NSUInteger)supportedInterfaceOrientations{
    
   
        return UIInterfaceOrientationMaskAll;
    
}






- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    
    
    [self.collectionView invalidateIntrinsicContentSize];
    
    
        
        
        if (UIDeviceOrientationIsPortrait(toInterfaceOrientation)) {
            
            [self.popUpView setFrame:CGRectMake(768, 0, 300, 1024)];
            [self portraitGallery];
        }else{
              [self.popUpView setFrame:CGRectMake(1024, 0, 300, 768)];
             [self landscapeGallery];
        }
        
     
     
    }
    
    
    
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
        
}






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

- (IBAction)goBack:(id)sender {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)toggleCaption:(id)sender {
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    
    if (orientation == UIDeviceOrientationPortrait) {
    
 
    
    
    if (captionVisible) {
        
        
        
        
        
        
        [UIView animateWithDuration:0.4
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [popUpView setFrame:CGRectMake(768, 0, 300, 1024)];
                         } completion:^(BOOL finished) {
                             captionVisible =FALSE;
                         }];
    }else{
        
        [UIView animateWithDuration:0.4
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [popUpView setFrame:CGRectMake(468, 0, 300, 1024)];
                         } completion:^(BOOL finished) {
                             captionVisible =TRUE;
                         }];

        
    }
    
   
    
    
    
    }else{
        
        
        if (captionVisible) {
            
            
            
            
            
            
            [UIView animateWithDuration:0.4
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 [popUpView setFrame:CGRectMake(1024, 0, 300, 768)];
                             } completion:^(BOOL finished) {
                                 captionVisible =FALSE;
                             }];
        }else{
            
            [UIView animateWithDuration:0.4
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 [popUpView setFrame:CGRectMake(724, 0, 300, 768)];
                             } completion:^(BOOL finished) {
                                 captionVisible =TRUE;
                             }];
            
            
        }

        
        
        
        
    }
    
    
    
}
@end
