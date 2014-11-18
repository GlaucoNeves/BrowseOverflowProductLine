//
//  AnswerTests.h
//  BrowseOverflow
//
//  Created by Graham J Lee on 25/02/2011.
//  Copyright 2011 Fuzzy Aliens Ltd. All rights reserved.
//
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

#import "MyTestCase.h"
#import <UIKit/UIKit.h>
@class Answer;

@interface AnswerTests : MyTestCase {
    Answer *answer;
    Answer *otherAnswer;
}

@end
