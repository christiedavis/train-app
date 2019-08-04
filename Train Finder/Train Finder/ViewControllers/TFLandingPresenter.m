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

@interface TFLandingPresenter()

@property (strong, nonatomic) TFRepositoryFactory* repoFactory;
@property (strong, nonatomic) CLLocation* lastRecordedLocation;

@property (strong, nonatomic) TFStopPointsResponse* stops;
@end


@implementation TFLandingPresenter

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
            CLLocation *london = [[CLLocation alloc] initWithLatitude: 51.507711 longitude: -0.107712];
            self.lastRecordedLocation = london;
            NSLog(@"%@", error);
        }
        
        [self getStops];
    }];
}

- (void)getStops {
    [self.repoFactory.apiService getStopsWithCallback:^(TFStopPointsResponse *response, NSError *error) {
        self.stops = response;
        [self.view refreshView];
    }];
}
//
//- (void)getImages: (NSString*)hashtag {
//
//    if (hashtag.length > 0) {
//        self.hashTag = [hashtag stringByReplacingOccurrencesOfString: @"#" withString: @""];
//    }
//
//    [self.service getImagesWithHashtag: self.hashTag Callback:^(TITweetSearchResponse *response, NSError *error) {
//        if (error) {
//            [self.view showErrorView: @"Error: loading of images failed"];
//
//        } else {
//
//            NSMutableArray *tempTweetArray = [[NSMutableArray alloc] init];
//
//            for (TITweet *tweet in response.statuses) {
//                if ([tweet isValidTweet]) {
//                    [tempTweetArray addObject: tweet];
//                    NSLog(@"%@: %@", tweet.user.screenName, [tweet.extendedEntities.media[0] mediaUrl]);
//
//                }
//            }
//            self.tweets = tempTweetArray;
//            self.searchMetadata = response.searchMetaData;
//
//            [self.view refreshView];
//            [self.view hideLoadingView];
//        }
//    }];
//}

// MARK: Table View Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0; //self.stops.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] init];
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 0;
}

@end
