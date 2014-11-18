//
//  StackOverflowCommunicator.h
//  BrowseOverflow
//
//  Created by Graham J Lee on 17/03/2011.
//  Copyright 2011 Fuzzy Aliens Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackOverflowCommunicatorDelegate.h"

@interface StackOverflowCommunicator : NSObject <NSURLConnectionDataDelegate> {
@protected
    NSURLConnection *fetchingConnection;
    NSMutableData *receivedData;
    // MOVIDOR PARA INTERFACE PROTEGIDA
    id <StackOverflowCommunicatorDelegate> __weak delegate;
@private

    void (^errorHandler)(NSError *);
    void (^successHandler)(NSString *);
}

@property (weak) id <StackOverflowCommunicatorDelegate> delegate;

// MOVIDO PARA INTERFACE PUBLICA
@property NSURL *fetchingURL;
- (void)fetchContentAtURL: (NSURL *)url errorHandler: (void(^)(NSError *error))errorBlock successHandler: (void(^)(NSString *objectNotation)) successBlock;
- (void)launchConnectionForRequest: (NSURLRequest *)request;
// ---

- (void)searchForQuestionsWithTag: (NSString *)tag;
- (void)downloadInformationForQuestionWithID: (NSInteger)identifier;
- (void)downloadAnswersToQuestionWithID: (NSInteger)identifier;

- (void)cancelAndDiscardURLConnection;
@end

extern NSString *StackOverflowCommunicatorErrorDomain;
