//
//  TFFacilityPresenter.m
//  Train Finder
//
//  Created by Christie Davis on 7/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "TFFacilityPresenter.h"

@interface TFFacilityPresenter()
@property (weak, nonatomic) TFAdditionalProperties* facility;
@end

@implementation TFFacilityPresenter

- (void)setFacility:(TFAdditionalProperties *)facility {
    self.facility = facility;
}

@end
