//
//  Answer.m
//  BrowseOverflow
//
//  Created by Graham J Lee on 25/02/2011.
//  Copyright 2011 Fuzzy Aliens Ltd. All rights reserved.
//

#import "Answer.h"
#import "Person.h"
#import "Configurator.h"

@implementation Answer

@synthesize text;
@synthesize person;
@synthesize accepted;
@synthesize score;
@synthesize date;

- (NSComparisonResult)compare:(Answer *)otherAnswer {
    if ([[Configurator readEntry:@"answerSorting"] isEqualToString:@"upvote"]) {
        return [self compareUpvote:otherAnswer];
    }
    if ([[Configurator readEntry:@"answerSorting"] isEqualToString:@"date"]) {
        return [self compareDate:otherAnswer];
    }
    return nil;
}

- (NSComparisonResult)compareUpvote:(Answer *)otherAnswer {
    if (accepted && !(otherAnswer.accepted)) {
        return NSOrderedAscending;
    } else if (!accepted && otherAnswer.accepted){
        return NSOrderedDescending;
    }
    if (score > otherAnswer.score) {
        return NSOrderedAscending;
    } else if (score < otherAnswer.score) {
        return NSOrderedDescending;
    } else {
        return NSOrderedSame;
    }
}

- (NSComparisonResult)compareDate:(Answer *)otherAnswer {
    return nil;
}


@end
