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
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation LineTableViewCell

+ (NSString*)reuseIdentifier {
    return @"LineTableViewCell";
}

- (void) setupWithPrediction:(TFArrivalPrediction*) prediction {
    self.lineNameLabel.text = prediction.platformName;
    self.timeLabel.text = [NSString stringWithFormat: @"%@", prediction.timeToStation];
}

@end
