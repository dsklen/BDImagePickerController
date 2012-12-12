//
//  ELCImagePickerDemoViewController.m
//  ELCImagePickerDemo
//
//  Created by Collin Ruffenach on 9/9/10.
//  Copyright 2010 ELC Technologies. All rights reserved.
//

#import "BDAppDelegate.h"
#import "BDImagePickerDemoViewController.h"
#import "BDImagePickerController.h"
#import "BDAlbumPickerController.h"

@implementation BDImagePickerDemoViewController


#pragma mark - Properties

@synthesize scrollView = _scrollView;


#pragma mark - API

- (IBAction)launchController:(id)sender;
{
    BDAlbumPickerController *albumController = [[BDAlbumPickerController alloc] initWithNibName:@"BDAlbumPickerController" bundle:[NSBundle mainBundle]];    
	
    BDImagePickerController *imagePicker = [[BDImagePickerController alloc] initWithRootViewController:albumController delegate:self];
    
	[self presentModalViewController:imagePicker animated:YES];
}


#pragma mark - BDImagePickerControllerDelegate Methods

- (void)imagePickerController:(BDImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info;
{	
	[self dismissModalViewControllerAnimated:YES];
	
    for ( UIView *viewToRemove in [self.scrollView subviews] )
    {
        [viewToRemove removeFromSuperview];
    }
    
	CGRect workingFrame = self.scrollView.frame;
	workingFrame.origin.x = 0;
	
	for(NSDictionary *dict in info) {
	
		UIImageView *imageview = [[UIImageView alloc] initWithImage:[dict objectForKey:UIImagePickerControllerOriginalImage]];
		[imageview setContentMode:UIViewContentModeScaleAspectFit];
		imageview.frame = workingFrame;
		
		[self.scrollView addSubview:imageview];
		
		workingFrame.origin.x = workingFrame.origin.x + workingFrame.size.width;
	}
	
	[self.scrollView setPagingEnabled:YES];
	[self.scrollView setContentSize:CGSizeMake(workingFrame.origin.x, workingFrame.size.height)];
}

- (void)imagePickerControllerDidCancel:(BDImagePickerController *)picker;
{
	[self dismissModalViewControllerAnimated:YES];
}

@end
