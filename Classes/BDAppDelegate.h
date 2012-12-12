//
//  ELCImagePickerDemoAppDelegate.h
//  ELCImagePickerDemo
//
//  Created by Collin Ruffenach on 9/9/10.
//  Copyright 2010 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BDImagePickerDemoViewController;

@interface BDAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) BDImagePickerDemoViewController *viewController;

@end

