//
//  TFAPIService.h
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Overcoat/Overcoat.h>

#import "TFStopsCollection.h"

@interface TFAPIService : OVCHTTPSessionManager
- (void)getStopsWithCallback:(void (^)(TFStopsCollection *response, NSError *error))callback;

@end
