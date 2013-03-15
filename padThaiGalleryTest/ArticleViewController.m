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
#import "ViewController.h"


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


- (void)viewDidLoad
{
    
     articleLayout = [[ArticleCVLayout alloc]init];
    [super viewDidLoad];
    
    [self.collectionView setCollectionViewLayout:articleLayout animated:YES];
     self.collectionView.allowsSelection = TRUE;

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








- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ViewController *vc = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];

       
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





@end
