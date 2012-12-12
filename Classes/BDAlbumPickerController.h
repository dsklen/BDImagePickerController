//
//  AlbumPickerController.h
//
//  Created by Matt Tuzzolo on 2/15/11.
//  Copyright 2012 Burnside Digital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface BDAlbumPickerController : UITableViewController

@property (nonatomic, strong) NSMutableArray *assetGroupsArray;
@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) ALAssetsLibrary *library;

- (void)selectedAssets:(NSArray *)assets;

@end

