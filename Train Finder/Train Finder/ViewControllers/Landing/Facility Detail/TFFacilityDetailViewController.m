//
//  TFFacilityDetailViewController.m
//  Train Finder
//
//  Created by Christie Davis on 7/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "TFFacilityDetailViewController.h"

@interface TFFacilityDetailViewController ()

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) TFAdditionalProperties* facility;

@end

@implementation TFFacilityDetailViewController

- (instancetype)initWithFacility: (TFAdditionalProperties*) facility {
    self = [super init];
    if (self) {
        self.facility = facility;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = self.facility.key;
    
}

@end
