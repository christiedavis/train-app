//
//  TFArrivalPrediction.h
//  Train Finder
//
//  Created by Christie Davis on 7/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Overcoat/Overcoat.h>
#import "MTLModel.h"

@interface TFArrivalPrediction : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString* arrivalId;
@property (strong, nonatomic) NSString* stationName;
@property (strong, nonatomic) NSString* platformName;
@property (strong, nonatomic) NSNumber* timeToStation;
@property (strong, nonatomic) NSString* towards;
@property (strong, nonatomic) NSString* destinationName;
    
@end
