//
//  StackOverflowComunicatorV20.m
//  BrowseOverflow
//
//  Created by Glauco on 11/2/14.
//  Copyright (c) 2014 Fuzzy Aliens Ltd. All rights reserved.
//

#import "StackOverflowCommunicatorV20.h"

@implementation StackOverflowCommunicatorV20

- (void)searchForQuestionsWithTag:(NSString *)tag {
    [self fetchContentAtURL: [NSURL URLWithString:
                              //                              [NSString stringWithFormat: @"http://api.stackoverflow.com/1.1/search?tagged=%@&pagesize=20", tag]]
                              [NSString stringWithFormat: @"https://api.stackexchange.com/2.2/questions?site=stackoverflow&tagged=%@&pagesize=20", tag]]
               errorHandler: ^(NSError *error) {
                   [delegate searchingForQuestionsFailedWithError: error];
               }
             successHandler: ^(NSString *objectNotation) {
                 [delegate receivedQuestionsJSON: objectNotation];
             }];
}

- (void)downloadInformationForQuestionWithID:(NSInteger)identifier {
    [self fetchContentAtURL: [NSURL URLWithString:
                              //                              [NSString stringWithFormat: @"http://api.stackoverflow.com/1.1/questions/%d?body=true", identifier]]
                              [NSString stringWithFormat: @"https://api.stackexchange.com/2.2/questions/%d?site=stackoverflow&body=true", identifier]]
               errorHandler: ^(NSError *error) {
                   [delegate fetchingQuestionBodyFailedWithError: error];
               }
             successHandler: ^(NSString *objectNotation) {
                 [delegate receivedQuestionBodyJSON: objectNotation];
             }];
}

- (void)downloadAnswersToQuestionWithID:(NSInteger)identifier {
    [self fetchContentAtURL: [NSURL URLWithString:
                              //                              [NSString stringWithFormat: @"http://api.stackoverflow.com/1.1/questions/%d/answers?body=true", identifier]]
                              [NSString stringWithFormat: @"http://api.stackexchange.com/2.2/questions/%d/answers?site=stackoverflow&body=true", identifier]]
               errorHandler: ^(NSError *error) {
                   [delegate fetchingAnswersFailedWithError: error];
               }
             successHandler: ^(NSString *objectNotation) {
                 [delegate receivedAnswerListJSON: objectNotation];
             }];
}

@end
