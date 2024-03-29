//x
//  TFCategoryCell.h
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFAdditionalProperties.h"

@interface TFCategoryCell : UICollectionViewCell

+ (NSString*)reuseIdentifier;
- (void)setup:(TFAdditionalProperties*) property;
+ (CGSize)sizeWithText: (NSString*) text withMaxWidth: (CGFloat) maxWidth;

@end

