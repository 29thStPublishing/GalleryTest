//
//  CustomNavController.m
//  PhotoGalleryDemo
//
//  Created by Tim Moore on 3/7/13.
//  Copyright (c) 2013 Tim Moore. All rights reserved.
//

#import "CustomNavController.h"

@interface CustomNavController ()

@end

@implementation CustomNavController

-(NSUInteger)supportedInterfaceOrientations
{
    return [self.topViewController supportedInterfaceOrientations];
}

-(BOOL)shouldAutorotate
{
    return YES;
}
@end
