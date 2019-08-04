//
//  TFLocationService.m
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "TFLocationService.h"

@interface TFLocationService()

@property (weak, nonatomic) CLLocationManager* locationManager;

@end

@implementation TFLocationService


- (BOOL)shouldCheckPermission {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status == kCLAuthorizationStatusNotDetermined) {
        return true;
    }
    
    // TODO: I would like to come back here and handle more permission states
    return false;
}

- (void)prepareToTrack {
    if (self.locationManager == nil) {
        CLLocationManager *locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate: self];
        self.locationManager = locationManager;
    }
}

- (void)requestPermission {
    [self prepareToTrack];
    [self.locationManager requestWhenInUseAuthorization];
}

- (void)getCurrentLocation {
    [self prepareToTrack];
    [self.locationManager requestLocation];
}

@end
