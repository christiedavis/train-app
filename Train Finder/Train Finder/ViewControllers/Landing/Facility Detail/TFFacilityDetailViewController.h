//
//  TFFacilityDetailViewController.h
//  Train Finder
//
//  Created by Christie Davis on 7/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFFacilityDetailViewDelegate.h"
#import "TFFacilityPresenterDelegate.h"

@interface TFFacilityDetailViewController : UIViewController <TFFacilityDetailViewDelegate>

@property (nonatomic, strong) id<TFFacilityPresenterDelegate> presenter;


@end

