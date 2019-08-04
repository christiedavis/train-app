//
//  TFStopPoint.m
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "TFStopPoint.h"

@interface TFStopPoint()

@property (strong, nonatomic) NSString* naptanId;
@property (strong, nonatomic) NSString* stopType;
@property (strong, nonatomic) NSNumber* lat;
@property (strong, nonatomic) NSNumber* lon;

@end

@implementation TFStopPoint

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"naptanId": @"naptanId",
             @"stopType": @"stopType",
             @"commonName": @"commonName",
             @"additionalProperties": @"additionalProperties",
             @"lat": @"lat",
             @"lon": @"lon"
             };
}

+ (NSValueTransformer *)additionalPropertiesJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass: TFAdditionalProperties.class];
}
@end
