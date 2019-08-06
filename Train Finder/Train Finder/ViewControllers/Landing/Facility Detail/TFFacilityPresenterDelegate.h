//
//  TFFacilityPresenterDelegate.h
//  Train Finder
//
//  Created by Christie Davis on 7/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TFFacilitySelectionDelegate.h"
#import "TFAdditionalProperties.h"

@protocol TFFacilityPresenterDelegate  <NSObject>

- (void)setFacility: (TFAdditionalProperties*) facility;

@end
