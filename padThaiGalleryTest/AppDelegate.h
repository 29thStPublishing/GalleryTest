//
//  AppDelegate.h
//  padThaiGalleryTest
//
//  Created by Tim Moore on 3/14/13.
//  Copyright (c) 2013 Tim Moore. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ArticleViewController;
@class CustomNavController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{

CustomNavController *customNavController;

}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ArticleViewController *viewController;

@end
