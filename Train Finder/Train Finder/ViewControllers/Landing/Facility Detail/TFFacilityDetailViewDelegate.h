//
//  TFFacilityDetailViewDelegate.h
//  Train Finder
//
//  Created by Christie Davis on 7/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFAdditionalProperties.h"

@protocol TFFacilityDetailViewDelegate <NSObject>
                                       
- (instancetype)initWithFacility: (TFAdditionalProperties*) facility;
                                    
@end
