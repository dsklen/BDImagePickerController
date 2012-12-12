//
//  AssetTablePicker.m
//
//  Created by Matt Tuzzolo on 2/15/11.
//  Copyright 2012 Burnside Digital. All rights reserved.
//

#import "BDAssetTablePicker.h"
#import "BDAssetCell.h"
#import "BDAsset.h"
#import "BDAlbumPickerController.h"


@implementation BDAssetTablePicker

@synthesize parent;
@synthesize selectedAssetsLabel;
@synthesize assetGroup, elcAssets;

-(void)viewDidLoad;
{        
	[self.tableView setSeparatorColor:[UIColor clearColor]];
	[self.tableView setAllowsSelection:NO];

    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    self.elcAssets = tempArray;
	
	UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction:)];
	[self.navigationItem setRightBarButtonItem:doneButtonItem];
	[self.navigationItem setTitle:@"Loading..."];

	[self performSelectorInBackground:@selector(preparePhotos) withObject:nil];
    
    // Show partial while full list loads
	[self.tableView performSelector:@selector(reloadData) withObject:nil afterDelay:.5];
}

-(void)preparePhotos;
{    
    @autoreleasepool {

        NSLog(@"enumerating photos");
        [self.assetGroup enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) 
         {         
             if(result == nil) 
             {
                 return;
             }
             
             BDAsset *elcAsset = [[BDAsset alloc] initWithAsset:result];
             [elcAsset setParent:self];
             [self.elcAssets addObject:elcAsset];
         }];    
        NSLog(@"done enumerating photos");
	
	[self.tableView reloadData];
	[self.navigationItem setTitle:@"Pick Photos"];
    
    }

}

- (void) doneAction:(id)sender {
	
	NSMutableArray *selectedAssetsImages = [[NSMutableArray alloc] init];
	    
	for( BDAsset *elcAsset in self.elcAssets ) 
    {		
		if([elcAsset selected]) {
			
			[selectedAssetsImages addObject:[elcAsset asset]];
		}
	}
        
    [(BDAlbumPickerController*)self.parent selectedAssets:selectedAssetsImages];
}


#pragma mark - UITableViewDataSource Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return ceil( [self.assetGroup numberOfAssets] / 4.0 );
}

- (NSArray*)assetsForIndexPath:(NSIndexPath *)_indexPath;
{
	int index = (_indexPath.row * 4);
	int maxIndex = (_indexPath.row * 4 + 3);
        
	if (maxIndex < [self.elcAssets count] )
    {
		return [NSArray arrayWithObjects:[self.elcAssets objectAtIndex:index],
				[self.elcAssets objectAtIndex:index+1],
				[self.elcAssets objectAtIndex:index+2],
				[self.elcAssets objectAtIndex:index+3],
				nil];
	}
    
	else if (maxIndex-1 < [self.elcAssets count] )
    {
		return [NSArray arrayWithObjects:[self.elcAssets objectAtIndex:index],
				[self.elcAssets objectAtIndex:index+1],
				[self.elcAssets objectAtIndex:index+2],
				nil];
	}
    
	else if (maxIndex-2 < [self.elcAssets count]) {
        
		return [NSArray arrayWithObjects:[self.elcAssets objectAtIndex:index],
				[self.elcAssets objectAtIndex:index+1],
				nil];
	}
    
	else if (maxIndex-3 < [self.elcAssets count]) {
        
		return [NSArray arrayWithObject:[self.elcAssets objectAtIndex:index]];
	}
    
    
	return nil;
}

// Customize the appearance of table view cells.

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
        
    BDAssetCell *cell = (BDAssetCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) 
    {		        
        cell = [[BDAssetCell alloc] initWithAssets:[self assetsForIndexPath:indexPath] reuseIdentifier:CellIdentifier];
    }	
	else 
    {		
		[cell setAssets:[self assetsForIndexPath:indexPath]];
	}
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	return 79.0f;
}

- (int)totalSelectedAssets;
{    
    int count = 0;
    
    for(BDAsset *asset in self.elcAssets) 
    {
		if([asset selected]) 
        {            
            count++;	
		}
	}
    
    return count;
}


@end
