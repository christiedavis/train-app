//
//  TFStationCell.h
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFStopPoint.h"

@interface TFStationCell : UITableViewCell<UICollectionViewDelegate, UICollectionViewDataSource>

+ (NSString*)reuseIdentifier;

- (void)setupWithStop:(TFStopPoint*) stopPoint;

@end
