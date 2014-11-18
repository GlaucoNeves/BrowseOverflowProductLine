//
//  ConfiguratorTests.m
//  BrowseOverflow
//
//  Created by Glauco on 10/21/14.
//  Copyright (c) 2014 Fuzzy Aliens Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Configurator.h"

@interface ConfiguratorTests : XCTestCase

@end

@implementation ConfiguratorTests

- (void)testLimitOfQuestionsShouldBeAnInteger {
    int limitOfQuestions = [Configurator readEntry:@"limitOfQuestions"];
    NSScanner *scanner = [NSScanner scannerWithString:	[NSString stringWithFormat:@"%d", limitOfQuestions]];
    XCTAssertTrue([scanner scanInt:&limitOfQuestions]);
}

- (void)testLimitOfQuestionsShouldBeGreaterThanZero {
    int limitOfQuestions = [[Configurator readEntry:@"limitOfQuestions"] intValue];
    XCTAssertTrue(limitOfQuestions > 0);
}

- (void)testLimitOfQuestionsShouldBeLessThanOneHundred {
    int limitOfQuestions = [[Configurator readEntry:@"limitOfQuestions"] intValue];
    XCTAssertTrue(limitOfQuestions < 100);
}






@end
