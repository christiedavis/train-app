//
//  TFLandingPresenter.m
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//


#import "TFLandingPresenter.h"
#import "TFRepositoryFactory.h"
#import <CoreLocation/CoreLocation.h>
#import "TFStationCell.h"
#import "TFLineTableViewCell.h"

@interface TFLandingPresenter()

@property (strong, nonatomic) TFRepositoryFactory* repoFactory;
@property (strong, nonatomic) CLLocation* lastRecordedLocation;

@property (strong, nonatomic) TFStopPointsResponse* stops;
@property (strong, nonatomic) NSDictionary<NSString*, NSArray<TFArrivalPrediction*>*>* predictionDict;

@end


@implementation TFLandingPresenter

double const ukMinLattitude = 49.9;
double const ukMaxLattitude = 58.7;
double const ukMinLongitude = -11.05;
double const ukMaxLongitude = 1.78;
double const ukDefaultLong = -0.107712;
double const ukDefaultLat = 51.507711;

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.repoFactory = [[TFRepositoryFactory alloc] init];
    return self;
}

- (void)findMyLocation {
    [self.repoFactory.locationService getCurrentLocationWithCallback:^(CLLocation *location, NSError *error) {
        
        self.lastRecordedLocation = location;
    
        if (error) {
            
            CLLocation *london = [[CLLocation alloc] initWithLatitude: ukDefaultLat longitude: ukDefaultLong];
            self.lastRecordedLocation = london;
            NSLog(@"%@", error);
        }
        
        self.lastRecordedLocation = [self processLocation: self.lastRecordedLocation ];
        
        [self getStopsForLocation: self.lastRecordedLocation];
    }];
}

// takes a location and ensures it is in london
- (CLLocation*)processLocation:(CLLocation*) location {
    if (location.coordinate.latitude < ukMinLattitude || location.coordinate.latitude > ukMaxLattitude || location.coordinate.longitude < ukMinLongitude || location.coordinate.longitude > ukMaxLongitude) {
        // check lattitude is in the UK else return default
        return [[CLLocation alloc] initWithLatitude: ukDefaultLat longitude: ukDefaultLong];
    }
    return location;
}

- (void)getStopsForLocation:(CLLocation*) location {
    
    NSString *longString = [NSString stringWithFormat: @"%f", location.coordinate.longitude];
    NSString *latString = [NSString stringWithFormat: @"%f", location.coordinate.latitude];
    
    [self.repoFactory.apiService getStopsForLat: latString andlon: longString WithCallback:^(TFStopPointsResponse *response, NSError *error) {
        self.stops = response;
        
        NSArray* stopStringArray = [self getStopList: self.stops];
        
        [self.repoFactory.apiService getArrivalTimes:stopStringArray WithCallback:^(NSDictionary<NSString *, NSArray<TFArrivalPrediction*>*> *response) {
            
            self.predictionDict = response;
            [self.view refreshView];
        }];
    }];
}

- (NSArray*)getStopList: (TFStopPointsResponse*)stops {
    
    NSMutableArray* stopStringArray = [[NSMutableArray alloc] init];
    for (TFStopPoint *stop in self.stops.stopPoints) {
        [stopStringArray addObject: stop.naptanId];
    }
    return stopStringArray;
}

- (NSArray<TFArrivalPrediction*>*)getPredictionArrayForSection:(NSInteger) section {
    return self.predictionDict[self.stops.stopPoints[section].naptanId];
}

// MARK: Table View Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.stops.stopPoints.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self getPredictionArrayForSection: section].count + 1; // + 1 for the title cell
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        TFStationCell *cell = [tableView dequeueReusableCellWithIdentifier: [TFStationCell reuseIdentifier]];
        [cell setupWithStop: self.stops.stopPoints[indexPath.section] andDelegate: self];
        return cell;
    } else {
        NSInteger adjustedRow = indexPath.row - 1;
        NSArray<TFArrivalPrediction*>* predictionArray = [self getPredictionArrayForSection: indexPath.section];
        TFArrivalPrediction *prediction = predictionArray[adjustedRow];
        
        TFLineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: [TFLineTableViewCell reuseIdentifier]];
        [cell setupWithPrediction: prediction];
        
        return cell;
    }
}

- (void)facilitySelected:(TFAdditionalProperties *)facility {
    [self.view presentFacility: facility];
}

@end
