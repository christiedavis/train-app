
//
//  TFStopPointsResponse.m
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "TFStopPointsResponse.h"
#import "TFStopPoint.h"
@interface TFStopPointsResponse()

@end

@implementation TFStopPointsResponse

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"stopPoints": @"stopPoints"
            
             };
}

+ (NSValueTransformer *)stopPointsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass: TFStopPoint.class];
}
@end
