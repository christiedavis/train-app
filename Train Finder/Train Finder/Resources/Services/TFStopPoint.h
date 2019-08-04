//
//  TFStopPoint.h
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "MTLModel.h"
#import <Overcoat/Overcoat.h>
#import "TFAdditionalProperties.h"

@interface TFStopPoint : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString* commonName;
@property (strong, nonatomic) NSArray<TFAdditionalProperties*>* additionalProperties;

@end
