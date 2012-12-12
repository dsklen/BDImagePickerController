//
//  AssetCell.m
//
//  Created by Matt Tuzzolo on 2/15/11.
//  Copyright 2012 Burnside Digital. All rights reserved.
//

#import "BDAssetCell.h"
#import "BDAsset.h"

@implementation BDAssetCell

@synthesize rowAssets = _rowAssets;

- (id)initWithAssets:(NSArray *)assets reuseIdentifier:(NSString *)identifier;
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    if ( self )
        _rowAssets = assets;

	return self;
}

- (void)setAssets:(NSArray *)assets;
{	
	for(UIView *view in [self subviews]) 
    {		
		[view removeFromSuperview];
	}
	
	self.rowAssets = assets;
}

- (void)layoutSubviews;
{    
	CGRect frame = CGRectMake( 4.0f, 2.0f, 75.0f, 75.0f );
	
	for ( BDAsset *elcAsset in self.rowAssets )
    {
		[elcAsset setFrame:frame];
		[elcAsset addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:elcAsset action:@selector(toggleSelection)]];
		[self addSubview:elcAsset];
		
		frame.origin.x = frame.origin.x + frame.size.width + 4;
	}
}

@end
