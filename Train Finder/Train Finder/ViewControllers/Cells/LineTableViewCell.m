//
//  LineTableViewCell.m
//  Train Finder
//
//  Created by Christie Davis on 7/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "LineTableViewCell.h"

@interface LineTableViewCell()

@property (strong, nonatomic) IBOutlet UILabel *lineNameLabel;

@end

@implementation LineTableViewCell

+ (NSString*)reuseIdentifier {
    return @"LineTableViewCell";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void) setupWithPrediction:(TFArrivalPrediction*) prediction {
    self.lineNameLabel.text = prediction.platformName;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
