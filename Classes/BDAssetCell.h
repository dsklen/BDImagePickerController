//
//  AssetCell.h
//
//  Created by Matt Tuzzolo on 2/15/11.
//  Copyright 2012 Burnside Digital. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BDAssetCell : UITableViewCell

- (id)initWithAssets:(NSArray *)assets reuseIdentifier:(NSString *)identifier;
- (void)setAssets:(NSArray *)assets;

@property (strong, nonatomic) NSArray *rowAssets;

@end
