//
//  TFFacilityPresenter.h
//  Train Finder
//
//  Created by Christie Davis on 7/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFFacilityPresenterDelegate.h"
#import "TFFacilityDetailViewDelegate.h"

@interface TFFacilityPresenter : NSObject <TFFacilityPresenterDelegate>

@property (weak, nonatomic) id<TFFacilityDetailViewDelegate> view;

@end
