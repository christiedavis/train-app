//
//  TFLocationService.h
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^LocationServicesCallback)(CLLocation *location, NSError *error);

@interface TFLocationService : NSObject<CLLocationManagerDelegate>

- (void)getCurrentLocationWithCallback:(void (^)(CLLocation *location, NSError *error))callback;

@end

