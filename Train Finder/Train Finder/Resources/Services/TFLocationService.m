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

@property (strong, nonatomic) CLLocationManager* locationManager;

@property (strong, nonatomic) LocationServicesCallback callback;

@end

@implementation TFLocationService
// Also adding a landing screen that tells users why we want their location before jumping straight into the prompt would be better UX

- (void)getCurrentLocationWithCallback:(void (^)(CLLocation *location, NSError *error))callback {
    self.callback = callback;
    [self prepareToTrack];
}

- (void)prepareToTrack {
    if (self.locationManager == nil) {
        CLLocationManager *locationManager = [[CLLocationManager alloc] init];
        self.locationManager = locationManager;
        [self.locationManager setDelegate: self];

        self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
        self.locationManager.pausesLocationUpdatesAutomatically = true;

        if ([self shouldCheckPermission]) {
            [self requestPermission];
        } else {
            [self.locationManager requestLocation];
        }
    }
}

- (BOOL)shouldCheckPermission {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status == kCLAuthorizationStatusNotDetermined) {
        return true;
    }
    // TODO: I would like to come back here and handle more permission states
    return false;
}

- (void)requestPermission {
    [self.locationManager requestWhenInUseAuthorization];
}

#pragma mark: LOCATION DELEGATE
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    switch (status) {
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            [self.locationManager requestLocation];
            
        default:
            break;
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    if (self.callback != nil) {
        self.callback(locations.firstObject, nil);
        self.callback = nil;
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if (self.callback != nil) {
        self.callback(nil, error);
        self.callback = nil;
    }
}

@end
