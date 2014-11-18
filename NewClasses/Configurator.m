//
// Created by Glauco on 10/21/14.
// Copyright (c) 2014 Fuzzy Aliens Ltd. All rights reserved.
//

#import "Configurator.h"


@implementation Configurator {

}

+ (NSString *)readEntry:(NSString *)key {
    NSURL *configurationFileURL = [[NSBundle mainBundle] URLForResource:@"configuration" withExtension:@"json"];
    NSString *configurationFilePath = [configurationFileURL absoluteString];
    NSData *configurationFileData = [NSData dataWithContentsOfURL:[NSURL URLWithString:configurationFilePath]];
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:configurationFileData options:kNilOptions error:&error];
    return [json valueForKey:key];
}


@end