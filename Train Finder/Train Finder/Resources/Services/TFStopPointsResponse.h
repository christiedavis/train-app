//
//  TFStopPointsResponse.h
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "MTLModel.h"
#import "TFStopPoint.h"
#import <Overcoat/Overcoat.h>

@interface TFStopPointsResponse : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSArray<TFStopPoint*>* stopPoints;

@end
