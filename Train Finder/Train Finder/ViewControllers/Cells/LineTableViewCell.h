//
//  LineTableViewCell.h
//  Train Finder
//
//  Created by Christie Davis on 7/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFArrivalPrediction.h"

@interface LineTableViewCell : UITableViewCell

+ (NSString*)reuseIdentifier;
- (void) setupWithPrediction:(TFArrivalPrediction*) prediction;

@end
