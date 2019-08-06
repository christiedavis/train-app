//
//  TFFacilityDetailViewController.m
//  Train Finder
//
//  Created by Christie Davis on 7/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "TFFacilityDetailViewController.h"

@interface TFFacilityDetailViewController ()

@end

@implementation TFFacilityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (instancetype)initWithFacility: (TFAdditionalProperties*) facility {
    self = [super init];
    if (self) {
        [self.presenter setFacility: facility];
    }
    return self;
}

- (void)hideLoadingView {
    
}

- (void)refreshView {
    
}

- (void)showErrorView:(NSString *)message {
    
}

- (void)showLoadingView {
    
}

@end
