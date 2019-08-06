//
//  TFFacilitySelectionDelegate.h
//  Train Finder
//
//  Created by Christie Davis on 7/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "TFAdditionalProperties.h"

@protocol TFFacilitySelectionDelegate

- (void)facilitySelected: (TFAdditionalProperties*) facility;

@end
