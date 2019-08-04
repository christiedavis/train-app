//
//  TFLandingPresenterDelgate.h
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol TFLandingPresenterDelgate  <NSObject, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

- (void)findMyLocation;

@end
