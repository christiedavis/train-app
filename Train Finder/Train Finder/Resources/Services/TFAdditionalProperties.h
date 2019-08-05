//
//  TFAdditionalProperties.h
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "MTLModel.h"
#import <Overcoat/Overcoat.h>

@interface TFAdditionalProperties : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString* category;
@property (strong, nonatomic) NSString* key;
@property (strong, nonatomic) NSString* value;

@end
