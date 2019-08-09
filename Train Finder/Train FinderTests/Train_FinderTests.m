//
//  Train_FinderTests.m
//  Train FinderTests
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TFLandingPresenter.h"

@interface Train_FinderTests : XCTestCase

@property (strong, nonatomic) TFLandingPresenter* presenter;

@end

// TODO: It would be good to add some more/any tests to this to validate my logic
@interface TFLandingPresenter (Tests)
    - (void)findMyLocationWithCompletion:(void (^)(void))completion;
@end

@implementation Train_FinderTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
}

@end
