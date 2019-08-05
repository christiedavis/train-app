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
    [self.textLabel setText: property.key];
}

+ (CGFloat)cellHeight {
    return 40;
}

+ (CGSize)sizeWithText: (NSString*) text withMaxWidth: (CGFloat) maxWidth {
    
    CGSize constraintRect = CGSizeMake(maxWidth, 40.0);
    UIFont* font = [UIFont systemFontOfSize: 14.0];

    CGRect boundingBox = [text boundingRectWithSize: constraintRect options: NSStringDrawingUsesLineFragmentOrigin attributes: @{ NSFontAttributeName : font } context: nil];
    
    CGSize cellSize = CGSizeMake(boundingBox.size.width + 16, 44);
    return cellSize;
}


@end
