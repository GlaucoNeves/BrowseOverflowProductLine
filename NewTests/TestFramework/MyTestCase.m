//
// Created by Glauco on 10/23/14.
// Copyright (c) 2014 Fuzzy Aliens Ltd. All rights reserved.
//

#import <objc/runtime.h>
#import "MyTestCase.h"
#import "Configurator.h"


@implementation MyTestCase


+ (NSArray *)testInvocations {
//    NSMutableArray *invocations = (NSMutableArray *)[super testInvocations];
    NSMutableArray *invocations = [[NSMutableArray alloc] init];
    int unsigned numMethods;
    Method *methods = class_copyMethodList([self class], &numMethods);
    for (int i = 0; i < numMethods; i++) {
        SEL selector = method_getName(methods[i]);//NSSelectorFromString(@"testLimitOfQuestions");
        NSMethodSignature *signature = [self instanceMethodSignatureForSelector:selector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        invocation.selector = selector;
        if ([MyTestCase hasTestPrefix:invocation]) {
            [invocations addObject:invocation];
        }
    }
    return invocations;
}

- (NSString *)config:(NSString *)entry{
    return [Configurator readEntry:entry];
}

//+ (NSArray *)testInvocations {
//    NSMutableArray *invocations = (NSMutableArray *)[super testInvocations];
//
//    int unsigned numMethods;
//    Method *methods = class_copyMethodList([self class], &numMethods);
//    for (int i = 0; i < numMethods; i++) {
//        SEL selector = method_getName(methods[i]);//NSSelectorFromString(@"testLimitOfQuestions");
//        NSMethodSignature *signature = [self instanceMethodSignatureForSelector:selector];
//        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
//        invocation.selector = selector;
//        if ([MyTestCase hasTestPrefix:invocation]) {
//            NSLog(@"%@", NSStringFromSelector(method_getName(methods[i])));
//            for (int i = 0; i < [[invocation methodSignature] numberOfArguments]; i++) {
//                NSLog(@"%s", [[invocation methodSignature] getArgumentTypeAtIndex:i]);
//            }
//            NSArray *splitMethodName = [NSStringFromSelector([invocation selector]) componentsSeparatedByString:@"_"];
//            NSString *string = [OCConfigurator valueForEntry:[splitMethodName objectAtIndex:1]]; // [OCConfigurator valueForEntry:@"limitOfQuestions"];
//            NSString *config = [[NSString alloc] initWithString:string];
//            NSLog(@"%hhd %@ %hhd", [string isEqualToString:@"20"], config, [string isKindOfClass:[NSString class]]);
//            [invocation setArgument:&config atIndex:2];
//            [invocations addObject:invocation];
//        }
//    }
//    return invocations;
//}

+ (unsigned) numberOfParameters:(NSInvocation *)invocation
{
    return [[invocation methodSignature] numberOfArguments] - 2;
}

+ (BOOL) hasTestPrefix:(NSInvocation *)invocation
{
    return [NSStringFromSelector([invocation selector]) hasPrefix:@"config"];
}

//+ (NSArray *)testInvocations {
//    NSArray  *instanceInvocations = [self isInheritingTestCases] ? [self senAllInstanceInvocations] : [self senInstanceInvocations];
//    NSMutableArray *testInvocations = [NSMutableArray array];
//    NSEnumerator *instanceInvocationEnumerator = [instanceInvocations objectEnumerator];
//    NSInvocation *each;
//
//    while (nil != (each = [instanceInvocationEnumerator nextObject])) {
//        if ([each hasTestCaseSignature]) {
//            [testInvocations addObject:each];
//        }
//    }
//    [testInvocations sortUsingSelector:@selector(compare:)];
//
//    return testInvocations;
//}

//+ (XCTestSuite *)defaultTestSuite {
//    XCTestSuite *testSuite = [[XCTestSuite alloc] initWithName:NSStringFromClass(self)];
//
//    NSArray *testInvocations = [self testInvocations];
//    NSLog(@"Glauco %@", [[testInvocations objectAtIndex:0] selector]);
//    [testSuite addTest:[XCTestCase testCaseWithInvocation:[testInvocations objectAtIndex:0]]];
//    if (true) {
//
//    } else {
//
//    }
//    return testSuite;
//}

@end
