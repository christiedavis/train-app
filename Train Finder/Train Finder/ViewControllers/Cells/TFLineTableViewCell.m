//
//  TFLineTableViewCell.m
//  Train Finder
//
//  Created by Christie Davis on 7/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "TFLineTableViewCell.h"

@interface TFLineTableViewCell()

@property (strong, nonatomic) IBOutlet UILabel *lineNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation TFLineTableViewCell

+ (NSString*)reuseIdentifier {
    return @"TFLineTableViewCell";
}

- (void) setupWithPrediction:(TFArrivalPrediction*) prediction {
    self.lineNameLabel.text = prediction.platformName;
    
    if (prediction.timeToStation.integerValue < 60) {
        // Less than an hour
        self.timeLabel.text = [NSString stringWithFormat: @"%@mins", prediction.timeToStation];
    } else {
        long minutes = prediction.timeToStation.integerValue % 60;
        long hours = prediction.timeToStation.integerValue / 60;
        
        self.timeLabel.text = [NSString stringWithFormat: @"%ldh %ldmins", hours, minutes];
    }
}

@end
