//
//  StackOverflowCommunicatorTests.h
//  BrowseOverflow
//
//  Created by Graham J Lee on 11/05/2011.
//  Copyright 2011 Fuzzy Aliens Ltd. All rights reserved.
//
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

#import "MyTestCase.h"
#import <UIKit/UIKit.h>

@class InspectableStackOverflowCommunicator;
@class StackOverflowCommunicatorV20;
@class NonNetworkedStackOverflowCommunicator;
@class MockStackOverflowManager;
@class FakeURLResponse;

@interface StackOverflowCommunicatorTests : MyTestCase {
    InspectableStackOverflowCommunicator *communicator;
    StackOverflowCommunicatorV20 *communicatorV20;
    NonNetworkedStackOverflowCommunicator *nnCommunicator;
    MockStackOverflowManager *manager;
    FakeURLResponse *fourOhFourResponse;
    NSData *receivedData;
}

@end
