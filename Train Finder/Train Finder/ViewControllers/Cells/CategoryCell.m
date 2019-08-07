//
//  CategoryCell.m
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "CategoryCell.h"

@interface CategoryCell()

@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation CategoryCell

+ (NSString*)reuseIdentifier {
    return @"CategoryCell";
}

- (void)setup:(TFAdditionalProperties*) property {
    NSString *dipslayString = property.key;
    
    [dipslayString stringByTrimmingCharactersInSet: NSCharacterSet.whitespaceAndNewlineCharacterSet];
    
    [self.textLabel setText: dipslayString];
    self.containerView.layer.cornerRadius = 3;
}

+ (CGSize)sizeWithText: (NSString*) text withMaxWidth: (CGFloat) maxWidth {
    
    CGSize constraintRect = CGSizeMake(maxWidth, 33.0);
    UIFont* font = [UIFont systemFontOfSize: 16.0];

    CGRect boundingBox = [text boundingRectWithSize: constraintRect options: NSStringDrawingUsesLineFragmentOrigin attributes: @{ NSFontAttributeName : font } context: nil];
    
    CGSize cellSize = CGSizeMake(boundingBox.size.width + 14, 33);
    return cellSize;
}

@end
