//
//  TopicViewController.m
//  BrowseOverflow
//
//  Created by Glauco on 11/2/14.
//  Copyright (c) 2014 Fuzzy Aliens Ltd. All rights reserved.
//

#import "TopicViewController.h"
#import "Topic.h"

@interface TopicViewController ()

@end

@implementation TopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addTopic:(id)sender {
    NSMutableArray *topics = [self.dataSource.getTopics mutableCopy];
    Topic *newTopic = [[Topic alloc] initWithName:_theNewTopic.text tag:_theNewTopic.text];
    [topics addObject:newTopic];
    [self.dataSource setTopics:topics];
}

@end
