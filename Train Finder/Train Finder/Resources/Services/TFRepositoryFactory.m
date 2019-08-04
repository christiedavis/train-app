//
//  TFRepositoryFactory.m
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "TFRepositoryFactory.h"

@interface TFRepositoryFactory()


@end

static TFRepositoryFactory *sharedInstance;

@implementation TFRepositoryFactory

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.apiService = [[TFAPIService alloc] init];
        self.locationService = [[TFLocationService alloc] init];
    }
    return self;
}


@end
