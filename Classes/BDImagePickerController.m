//
//  ELCImagePickerController.m
//  ELCImagePickerDemo
//
//  Created by Collin Ruffenach on 9/9/10.
//  Copyright 2010 ELC Technologies. All rights reserved.
//

#import "BDImagePickerController.h"
#import "BDAsset.h"
#import "BDAssetCell.h"
#import "BDAssetTablePicker.h"
#import "BDAlbumPickerController.h"

@implementation BDImagePickerController


#pragma mark - Properties

@synthesize pickerDelegate = _pickerDelegate;

#pragma mark - API

- (void)cancelImagePicker;
{
//	if ( [self.pickerDelegate respondsToSelector:@selector(imagePickerControllerDidCancel:)] )
//		[self.pickerDelegate imagePickerControllerDidCancel:self];
}
 
-(void)selectedAssets:(NSArray*)_assets {

	NSMutableArray *returnArray = [[NSMutableArray alloc] init];
	
	for( ALAsset *asset in _assets )
    {
		NSMutableDictionary *workingDictionary = [[NSMutableDictionary alloc] init];
		[workingDictionary setObject:[asset valueForProperty:ALAssetPropertyType] forKey:@"UIImagePickerControllerMediaType"];
        [workingDictionary setObject:[UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]] forKey:@"UIImagePickerControllerOriginalImage"];
		[workingDictionary setObject:[[asset valueForProperty:ALAssetPropertyURLs] valueForKey:[[[asset valueForProperty:ALAssetPropertyURLs] allKeys] objectAtIndex:0]] forKey:@"UIImagePickerControllerReferenceURL"];
		
		[returnArray addObject:workingDictionary];
    }
	
    [self popToRootViewControllerAnimated:NO];
    [[self parentViewController] dismissModalViewControllerAnimated:YES];
    
	if([self.delegate respondsToSelector:@selector(elcImagePickerController:didFinishPickingMediaWithInfo:)]) {
		[self.delegate performSelector:@selector(elcImagePickerController:didFinishPickingMediaWithInfo:) withObject:self withObject:[NSArray arrayWithArray:returnArray]];
	}
}


#pragma mark - View Lifecycle

- (id)initWithRootViewController:(UIViewController *)rootViewController delegate:(id<BDImagePickerControllerDelegate>)pickerDelegate;
{
    self = [super initWithRootViewController:rootViewController];
    if ( self )
    {
        _pickerDelegate = pickerDelegate;
    }
    return self;
}


#pragma mark - Memory management

- (void)didReceiveMemoryWarning {    
    NSLog(@"ELC Image Picker received m emory warning.");
    
    [super didReceiveMemoryWarning];
}


@end
