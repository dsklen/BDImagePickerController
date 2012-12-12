//
//  ELCImagePickerDemoViewController.h
//  ELCImagePickerDemo
//
//  Created by Collin Ruffenach on 9/9/10.
//  Copyright 2010 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BDImagePickerController.h"

@interface BDImagePickerDemoViewController : UIViewController <BDImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;

- (IBAction)launchController:(id)sender;

@end
