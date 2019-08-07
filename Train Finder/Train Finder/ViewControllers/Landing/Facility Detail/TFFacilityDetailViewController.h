//
//  TFFacilityDetailViewController.h
//  Train Finder
//
//  Created by Christie Davis on 7/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFFacilityDetailViewDelegate.h"
#import "TFAdditionalProperties.h"

// TODO: This should have a presenter, but for the case of this example, the creen is simple enough to not bother.
@interface TFFacilityDetailViewController : UIViewController

- (instancetype)initWithFacility: (TFAdditionalProperties*) facility;

@end

