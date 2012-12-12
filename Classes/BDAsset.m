//
//  Asset.m
//
//  Created by Matt Tuzzolo on 2/15/11.
//  Copyright 2012 Burnside Digital. All rights reserved.
//

#import "BDAsset.h"
#import "BDAssetTablePicker.h"

@implementation BDAsset

@synthesize asset = _asset;
@synthesize parent;


- (id)initWithAsset:(ALAsset *)asset;
{	
    self = [super initWithFrame:CGRectZero];
    if ( self )
        {
		self.asset = asset;
		
		CGRect viewFrames = CGRectMake( 0.0f, 0.0f, 75.0f, 75.0f );
		
		UIImageView *assetImageView = [[UIImageView alloc] initWithFrame:viewFrames];
		[assetImageView setContentMode:UIViewContentModeScaleToFill];
		[assetImageView setImage:[UIImage imageWithCGImage:[self.asset thumbnail]]];
		[self addSubview:assetImageView];
		
		self.overlayView = [[UIImageView alloc] initWithFrame:viewFrames];
		self.overlayView.image = [UIImage imageNamed:@"Overlay.png"];
		self.overlayView.hidden = YES;
		[self addSubview:self.overlayView];
    }
    
	return self;	
}

- (void)toggleSelection;
{    
	self.overlayView.hidden = !self.overlayView.hidden;
}

- (BOOL)selected;
{	
	return !self.overlayView.hidden;
}

- (void)setSelected:(BOOL)selected;
{    
	[self.overlayView setHidden:!selected];
}


@end

