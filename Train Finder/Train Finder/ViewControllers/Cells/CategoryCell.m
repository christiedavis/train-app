//
//  CategoryCell.m
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "CategoryCell.h"

@interface CategoryCell()

@property (strong, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation CategoryCell

+ (NSString*)reuseIdentifier {
    return @"CategoryCell";
}

- (void)setup:(TFAdditionalProperties*) property {
    [self.textLabel setText: property.value];
}


@end
