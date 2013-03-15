//
//  PhotoCVCell.m
//  PhotoGalleryDemo
//
//  Created by Tim Moore on 2/26/13.
//  Copyright (c) 2013 Tim Moore. All rights reserved.
//

#import "PhotoCVCell.h"

@implementation PhotoCVCell
@synthesize ImageView;



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"PhotoCVCell" owner:self options:nil];
        
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        self = [arrayOfViews objectAtIndex:0];
       
    }
    
    return self;
    
}


/*
-(void)prepareForReuse
{
   [self setImageView:nil];
}

-(void)setImage:(UIImage *)image
{
    self.ImageView.image = image;
}

 */
 
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
