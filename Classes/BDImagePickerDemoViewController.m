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

@synthesize scrollview;

-(IBAction)launchController {
	
    BDAlbumPickerController *albumController = [[BDAlbumPickerController alloc] initWithNibName:@"ELCAlbumPickerController" bundle:[NSBundle mainBundle]];    
	BDImagePickerController *elcPicker = [[BDImagePickerController alloc] initWithRootViewController:albumController];
    [albumController setParent:elcPicker];
	[elcPicker setDelegate:self];
    
    BDAppDelegate *app = (BDAppDelegate *)[[UIApplication sharedApplication] delegate];
	[app.viewController presentModalViewController:elcPicker animated:YES];
    [elcPicker release];
    [albumController release];
}

#pragma mark ELCImagePickerControllerDelegate Methods

- (void)elcImagePickerController:(BDImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info {
	
	[self dismissModalViewControllerAnimated:YES];
	
    for (UIView *v in [scrollview subviews]) {
        [v removeFromSuperview];
    }
    
	CGRect workingFrame = scrollview.frame;
	workingFrame.origin.x = 0;
	
	for(NSDictionary *dict in info) {
	
		UIImageView *imageview = [[UIImageView alloc] initWithImage:[dict objectForKey:UIImagePickerControllerOriginalImage]];
		[imageview setContentMode:UIViewContentModeScaleAspectFit];
		imageview.frame = workingFrame;
		
		[scrollview addSubview:imageview];
		[imageview release];
		
		workingFrame.origin.x = workingFrame.origin.x + workingFrame.size.width;
	}
	
	[scrollview setPagingEnabled:YES];
	[scrollview setContentSize:CGSizeMake(workingFrame.origin.x, workingFrame.size.height)];
}

- (void)elcImagePickerControllerDidCancel:(BDImagePickerController *)picker {

	[self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end