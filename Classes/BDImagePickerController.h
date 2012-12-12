//
//  ELCImagePickerController.h
//  ELCImagePickerDemo
//
//  Created by Collin Ruffenach on 9/9/10.
//  Copyright 2010 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BDImagePickerControllerDelegate;


@interface BDImagePickerController : UINavigationController <UINavigationControllerDelegate>

@property (unsafe_unretained, nonatomic) id<BDImagePickerControllerDelegate> pickerDelegate;

- (id)initWithRootViewController:(UIViewController *)rootViewController delegate:(id<BDImagePickerControllerDelegate>)pickerDelegate;
- (void)selectedAssets:(NSArray *)assets;
- (void)cancelImagePicker;

@end


@protocol BDImagePickerControllerDelegate

@required
- (void)imagePickerController:(BDImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info;
- (void)imagePickerControllerDidCancel:(BDImagePickerController *)picker;

@end

