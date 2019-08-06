//
//  TFStationCell.h
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFStopPoint.h"
#import "TFFacilitySelectionDelegate.h"

@interface TFStationCell : UITableViewCell<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

+ (NSString*)reuseIdentifier;

- (void)setupWithStop: (TFStopPoint*) stopPoint andDelegate: (id<TFFacilitySelectionDelegate>) selectionDelegate;

@end
