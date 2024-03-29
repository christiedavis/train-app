//
//  TFAPIService.h
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Overcoat/Overcoat.h>
#import "TFArrivalPrediction.h"

#import "TFStopPointsResponse.h"

@interface TFAPIService : OVCHTTPSessionManager

- (void)getStopsForLat: (NSString*) lat andlon: (NSString*) lon WithCallback:(void (^)(TFStopPointsResponse *response, NSError *error))callback;

- (void)getArrivalTimes:(NSArray<NSString*>*) stopIdArray WithCallback:(void (^)(NSDictionary<NSString*, NSArray<TFArrivalPrediction*>*>* response))callback;

@end
