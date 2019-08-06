//
//  TFLandingViewController.h
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFLandingPresenterDelgate.h"
#import "TFLandingViewDelegate.h"

@interface TFLandingViewController : UIViewController <TFLandingViewDelegate>

@property (nonatomic, strong) id<TFLandingPresenterDelgate> presenter;

@end
