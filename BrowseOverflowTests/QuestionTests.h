//
//  QuestionTests.h
//  BrowseOverflow
//
//  Created by Graham J Lee on 21/02/2011.
//  Copyright 2011 Fuzzy Aliens Ltd. All rights reserved.
//
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

#import "MyTestCase.h"
#import <UIKit/UIKit.h>
//#import "application_headers" as required
@class Question;
@class Answer;
@class Person;

@interface QuestionTests : MyTestCase {
    Question *question;
    Person *asker;
    Answer *lowScore;
    Answer *highScore;
}

@end
