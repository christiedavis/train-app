//
//  TFArrivalPrediction.m
//  Train Finder
//
//  Created by Christie Davis on 7/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "TFArrivalPrediction.h"

@implementation TFArrivalPrediction

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"arrivalId": @"naptanId",
             @"stationName": @"stationName",
             @"platformName": @"platformName",
             @"timeToStation": @"timeToStation",
             @"towards": @"towards",
             @"destinationName": @"destinationName"
             };
}
    
@end
