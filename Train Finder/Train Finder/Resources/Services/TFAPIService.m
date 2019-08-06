//
//  TFAPIService.m
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "TFAPIService.h"

@implementation TFAPIService

NSString *const apiAppId = @"48a39fc4";
NSString *const apiKey = @"ec618983d8e46a7c7e7845bb84e07f22";
NSString *const baseUrl = @"https://api.tfl.gov.uk/";
NSString *const stopsUrl = @"StopPoint";
NSString *const stopTypes = @"NaptanMetroStation";

- (void)getStopsForLat: (NSString*) lat andlon: (NSString*) lon WithCallback:(void (^)(TFStopPointsResponse *response, NSError *error))callback {
    
    NSDictionary* parameters = @{
                                 @"radius": @"2000",
                                 @"lat": lat,
                                 @"lon": lon,
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

#pragma mark - Subclass overrides
+ (NSDictionary<NSString *, Class> *)modelClassesByResourcePath {
    return @{
             stopsUrl: TFStopPointsResponse.class,
             };
}



@end
