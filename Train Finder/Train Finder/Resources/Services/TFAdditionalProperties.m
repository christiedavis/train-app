//
//  TFAdditionalProperties.m
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "TFAdditionalProperties.h"


// Categories
// Facility addess geo
// value yes 1 0 2
//
@interface TFAdditionalProperties()

@property (strong, nonatomic) NSString* category;
@property (strong, nonatomic) NSString* value;

@end

@implementation TFAdditionalProperties

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"category": @"category",
             @"value": @"value"
             };
}

@end
