//
//  Asset.h
//
//  Created by Matt Tuzzolo on 2/15/11.
//  Copyright 2012 Burnside Digital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>


@interface BDAsset : UIView

@property (nonatomic, strong) ALAsset *asset;
@property (nonatomic, unsafe_unretained) id parent;
@property (nonatomic, strong) UIImageView *overlayView;
@property (assign) BOOL selected;

- (id)initWithAsset:(ALAsset *)asset;
- (BOOL)selected;

@end