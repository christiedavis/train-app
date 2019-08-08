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

@property (strong, nonatomic) NSArray<TFStopPoint*>* stopList;
@property (strong, nonatomic) NSDictionary<NSString*, NSArray<TFArrivalPrediction*>*>* predictionDict;

@property (strong, nonatomic) NSTimer* timer;

@property (nonatomic) BOOL isInitialised; // Used to ensure we don't fire the timer too many times.

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

- (void)load {
    [self findMyLocationWithCompletion:^{
       
        // Ensures the location is within UK borders
        self.lastRecordedLocation = [self processLocation: self.lastRecordedLocation];
        
        [self getStopsForLocation: self.lastRecordedLocation
                   withCompletion:^{
                       
                       NSArray* stopStringArray = [self getStopListAsStringArray: self.stopList];
                       
                       [self.repoFactory.apiService getArrivalTimes:stopStringArray WithCallback:^(NSDictionary<NSString *, NSArray<TFArrivalPrediction*>*> *response) {
                           
                           self.predictionDict = response;
                           self.isInitialised = YES;
                           [self startRefreshTimer];
                           
                           [self.view refreshView];
                       }];
                       
                   }];
    }];
}

// MARK: Timer handling
- (void)startRefreshTimer {
    if (self.timer == nil && self.isInitialised == YES) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval: 30 repeats: YES block:^(NSTimer* timer) {
            [self.repoFactory.apiService getArrivalTimes: self.predictionDict.allKeys WithCallback:^(NSDictionary<NSString *, NSArray<TFArrivalPrediction*>*> *response) {
                self.predictionDict = response;
                [self.view refreshView];
            }];
        }];
    }
}

- (void)stopRefreshTimer {
    if (self.timer != nil) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

// MARK: Location Handling
- (void)findMyLocationWithCompletion:(void (^)(void))completion   {
    // Get the users location, or default it to London.
    [self.repoFactory.locationService getCurrentLocationWithCallback:^(CLLocation *location, NSError *error) {
        
        self.lastRecordedLocation = location;
    
        if (error) {
            // If there is an error - update it to be defaulted to london
            CLLocation *london = [[CLLocation alloc] initWithLatitude: ukDefaultLat longitude: ukDefaultLong];
            self.lastRecordedLocation = london;
            NSLog(@"%@", error);
        }
        completion();
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

// MARK: API Calls
- (void)getStopsForLocation:(CLLocation*) location withCompletion:(void (^)(void))completion {
    
    NSString *longString = [NSString stringWithFormat: @"%f", location.coordinate.longitude];
    NSString *latString = [NSString stringWithFormat: @"%f", location.coordinate.latitude];
    
    [self.repoFactory.apiService getStopsForLat: latString andlon: longString WithCallback:^(TFStopPointsResponse *response, NSError *error) {
        if (error) {
            // TODO: it would be good to update this to have a retry button
            [self.view showErrorView: @"Sorry, something went wrong - try again later"];
        }
        
        // TODO: it would be nice to sort these in order of proximaty to the user.
        self.stopList = response.stopPoints;
        completion();
    }];
}

// pull out a list of station ids
- (NSArray*)getStopListAsStringArray: (NSArray<TFStopPoint*>*)stops {
    
    NSMutableArray* stopStringArray = [[NSMutableArray alloc] init];
    for (TFStopPoint *stop in stops) {
        [stopStringArray addObject: stop.naptanId];
    }
    return stopStringArray;
}

- (NSArray<TFArrivalPrediction*>*)getPredictionArrayForSection:(NSInteger) section {
    return self.predictionDict[self.stopList[section].naptanId];
}

// MARK: Table View Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.stopList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self getPredictionArrayForSection: section].count + 1; // + 1 for the title cell
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        // The first item is always
        TFStationCell *cell = [tableView dequeueReusableCellWithIdentifier: [TFStationCell reuseIdentifier]];
        [cell setupWithStop: self.stopList[indexPath.section] andDelegate: self];
        return cell;
    } else {
        // adjust for the title cell
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
