//
//  TFLandingViewDelegate.h
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TFLandingViewDelegate <NSObject>

- (void)showLoadingView;
- (void)hideLoadingView;
- (void)refreshView;

- (void)activateTapGestureRecognizer;
- (void)dismissKeyboard;

//- (void)presentImage:(TITweet*) tweet;
- (void)showErrorView:(NSString*) message;

@end
