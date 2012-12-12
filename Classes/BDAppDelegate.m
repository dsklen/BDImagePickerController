//
//  ELCImagePickerDemoAppDelegate.m
//  ELCImagePickerDemo
//
//  Created by Collin Ruffenach on 9/9/10.
//  Copyright 2010 ELC Technologies. All rights reserved.
//

#import "BDAppDelegate.h"
#import "BDImagePickerDemoViewController.h"

@implementation BDAppDelegate


#pragma mark - Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
{    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    BDImagePickerDemoViewController *mainViewController = [[BDImagePickerDemoViewController alloc] initWithNibName:@"BDImagePickerDemoViewController" bundle:nil];
    self.viewController = mainViewController;
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
