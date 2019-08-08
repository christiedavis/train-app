//
//  TFAPIService.m
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "TFAPIService.h"
#import "TFArrivalPrediction.h"

@implementation TFAPIService

NSString *const apiAppId = @"48a39fc4";
NSString *const apiKey = @"ec618983d8e46a7c7e7845bb84e07f22";
NSString *const baseUrl = @"https://api.tfl.gov.uk/";
NSString *const stopsUrl = @"StopPoint";
NSString *const arrivalsUrl = @"Arrivals";
NSString *const stopTypes = @"NaptanMetroStation,NaptanRailStation";

//https://api.tfl.gov.uk/Stoppoint?app_id=[app_id]&radius=1000&modes=tube&app_key=[app_key]&lon=[lon]&lat=[lat]&stoptypes=NaptanMetroStation,NaptanRailStation

//https://api.tfl.gov.uk/StopPoint/[naptan_id]/Arrivals?modes=tube&app_id=[app_id]&app_key=[app_key]

- (void)getStopsForLat: (NSString*) lat andlon: (NSString*) lon WithCallback:(void (^)(TFStopPointsResponse *response, NSError *error))callback {
    
    NSDictionary* parameters = @{
                                 @"radius": @"1000",
                                 @"lat": lat,
                                 @"lon": lon,
                                 @"modes": @"tube",
                                 @"app_id": apiAppId,
                                 @"app_key": apiKey,
                                 @"stopTypes": stopTypes
                                 };
    
    [self GET:[NSString stringWithFormat: @"%@%@", baseUrl, stopsUrl]
   parameters:parameters
      success:^(NSURLSessionDataTask * _Nonnull task, OVCResponse* responseObject) {
          NSLog(@"yay");
          
          callback(responseObject.result, nil);
      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          NSLog(@"Boo");
          callback(nil, error);
      }];
}

- (void)getArrivalTimes:(NSArray<NSString*>*) stopIdArray WithCallback:(void (^)(NSDictionary<NSString*, NSArray<TFArrivalPrediction*>*>* response))callback {
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] initWithCapacity: stopIdArray.count];
    
    // I think this would be done better with promises
    for (NSString* stopId in stopIdArray) {
        
        [self getArrivalsFor: stopId WithCallback:^(TFArrivalPrediction *response, NSError *error) {
            if (response) {
                dict[stopId] = response;
                
            } else if (error) {
                dict[stopId] = @"error";
            } else {
                dict[stopId] = @"noresponse";
            }
            
            if (dict.allKeys.count == stopIdArray.count) {
                // all calls finished
                callback(dict);
            }
        }];
    }
}

- (void)getArrivalsFor: (NSString*) naptanId WithCallback:(void (^)(TFArrivalPrediction *response, NSError *error))callback {
    NSDictionary* parameters = @{
                                 @"modes": @"tube",
                                 @"app_id": apiAppId,
                                 @"app_key": apiKey
                                 };
    
    [self GET:[NSString stringWithFormat: @"%@%@/%@/%@", baseUrl, stopsUrl, naptanId, arrivalsUrl]
   parameters:parameters
      success:^(NSURLSessionDataTask * _Nonnull task, OVCResponse* responseObject) {
          NSLog(@"yay");
          
          callback(responseObject.result, nil);
      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          NSLog(@"Boo");
          callback(nil, error);
      }];
}


#pragma mark - Subclass overrides
+ (NSDictionary<NSString *, Class> *)modelClassesByResourcePath {
    
    return @{
             stopsUrl: TFStopPointsResponse.class,
             @"StopPoint/*/*": [TFArrivalPrediction class]
             };
}

@end
