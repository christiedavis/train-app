//
//  TFRepositoryFactory.h
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFLocationService.h"
#import "TFAPIService.h"

@interface TFRepositoryFactory : NSObject

@property (strong, nonatomic) TFLocationService* locationService;
@property (strong, nonatomic) TFAPIService* apiService;

//+ (TFRepositoryFactory*)shared;

@end
