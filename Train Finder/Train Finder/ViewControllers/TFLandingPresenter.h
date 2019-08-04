//
//  TFLandingPresenter.h
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFLandingPresenter.h"
#import "TFLandingPresenterDelgate.h"
#import "TFLandingViewDelegate.h"

@interface TFLandingPresenter : NSObject <TFLandingPresenterDelgate>

@property (weak, nonatomic) id<TFLandingViewDelegate> view;

@end

